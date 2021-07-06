import 'dart:async';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/domain/setting/enum/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/enum/setting_property.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_value_properties.dart';
import 'package:wattway_by_colas/domain/setting/models/settings_values.dart';
import 'package:wattway_by_colas/domain/statistics/enum/statistic_category.dart';
import 'package:wattway_by_colas/domain/statistics/enum/statistic_property.dart';
import 'package:wattway_by_colas/domain/statistics/fake/realtime_data_set.fake.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set_properties.dart';
import 'package:wattway_by_colas/infrastructure/core/bluetooth/bluetooth_service.dart';
import 'package:wattway_by_colas/infrastructure/core/bluetooth/enum/command_type.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';

class WattwayProtocol extends GetxService {
  final BluetoothService btService = Get.find();

  Worker? transactionWorker;
  late Function(List<int>) transactionCallback = (_) {};

  /// When the service starts
  ///
  /// Setting the log level to error only and remove debug prints from
  /// flutter_blue package
  Future<WattwayProtocol> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  /// When the services closing
  ///
  /// The method dispose the running worker and remove it
  /// from the cache
  void onClose() {
    _cancelPreviousTransaction();
    super.onClose();
  }

  void _cancelPreviousTransaction({VoidCallback? callback}) {
    if (transactionWorker != null && !transactionWorker!.disposed) {
      transactionWorker!.dispose();
      if (callback != null) callback();
    }
  }

  /// Send a message command to the connected bluetooth device
  ///
  /// This methods is used to send a new message to
  /// the board. The [message] is split into multiple packets
  /// of [maxBytesLength] and send in queue until length is full
  Future<List<RealtimeDataSetProperties>> readCommandStatistic({
    required StatisticCategory category,
    required StatisticProperty property,
    VoidCallback? onFinished,
  }) async {
    final completer = Completer<List<RealtimeDataSetProperties>>();
    final sampleData = fakeRealtimeDataSet.firstWhere((cat) => cat.category == category).data;

    _cancelPreviousTransaction();
    transactionWorker = ever(
      btService.endedTransactionPacket,
      (List<int> packet) {
        if (packet.length == 0) return;
        Uint8List bytes = Uint8List.fromList(packet.skip(7).toList());
        int skipBytes = 0;
        List<RealtimeDataSetProperties> tmp = [];

        sampleData.forEach((sample) {
          int value = sample.property.parseFromBuffer(bytes.buffer, skipBytes);
          bool disabled = sample.property.isDisabled(bytes.buffer, skipBytes);
          skipBytes += sample.property.bytesAmount();

          tmp.add(
            RealtimeDataSetProperties(
              property: sample.property,
              value: disabled ? sample.defaultValue : value.toDouble(),
              disabled: disabled,
            ),
          );
        });

        Future.delayed(
          Duration(milliseconds: 500),
          () {
            completer.complete(tmp);
            _cancelPreviousTransaction(callback: onFinished);
          },
        );
      },
    );

    List<int> packet = [category.toByte(), property.toByte()];
    await btService.sendPacket(CommandType.READ, raw: packet);
    return completer.future;
  }

  Future<List<SettingValueProperties>> readCommandSetting({
    required SettingCategoryType category,
    required SettingProperty property,
    VoidCallback? onFinished,
  }) async {
    final completer = Completer<List<SettingValueProperties>>();
    final sampleData = settingsValues.firstWhere((cat) => cat.category == category).datas!;

    _cancelPreviousTransaction();
    transactionWorker = ever(
      btService.endedTransactionPacket,
      (List<int> packet) {
        if (packet.length == 0) return;
        Uint8List bytes = Uint8List.fromList(packet.skip(7).toList());
        int skipBytes = 0;
        List<SettingValueProperties> tmp = [];

        sampleData.forEach((sample) {
          dynamic value = sample.property.parseFromBuffer(bytes.buffer, skipBytes);
          bool disabled = sample.property.isDisabled(bytes.buffer, skipBytes);
          skipBytes += sample.property.bytesAmount();

          tmp.add(
            SettingValueProperties(
              property: sample.property,
              value: (disabled ? sample.defaultValue : value).toString(),
              disabled: disabled,
            ),
          );
        });

        Future.delayed(
          Duration(milliseconds: 500),
          () {
            completer.complete(tmp);
            _cancelPreviousTransaction(callback: onFinished);
          },
        );
      },
    );

    List<int> packet = [category.toByte(), property.toByte()];
    await btService.sendPacket(CommandType.READ, raw: packet);
    return completer.future;
  }

  /// Send a message command to the connected bluetooth device
  ///
  /// This methods is used to send a new message to
  /// the board. The [message] is split into multiple packets
  /// of [maxBytesLength] and send in queue until length is full
  Future<void> sendMessageCommand(String message) async {
    List<int> messageAscii = StringUtils.asciiCodec.encode(message);
    final list = Uint16List.fromList([(btService.magicKey.length + messageAscii.length + 4)]);
    List<int> bigPacket = [
      ...btService.magicKey,
      ...Uint8List.view(list.buffer),
      2, // command 'message'
      message.length,
      ...messageAscii
    ];
    int packetAmount = (bigPacket.length / btService.maxBytesLength).ceil();

    for (int index = 0; index <= packetAmount; index++) {
      List<int> packet = bigPacket.take(btService.maxBytesLength).toList();
      if (index > 0) {
        packet.insertAll(0, [index, 0]);
        if (index != packetAmount) {
          if (bigPacket.length < btService.maxBytesLength - 2) {
            bigPacket.clear();
          } else {
            bigPacket.removeRange(0, btService.maxBytesLength - 2);
          }
        }
      } else {
        if (bigPacket.length < btService.maxBytesLength) {
          bigPacket.clear();
        } else {
          bigPacket.removeRange(0, btService.maxBytesLength);
        }
      }

      if (packet.length == 2) continue;
      Uint8List newPacket = Uint8List(20);
      newPacket.setAll(0, packet.take(btService.maxBytesLength).toList());
      //Get.log("[BT] sending message hex: 0x" + hex.encode(newPacket));
      await btService.writeCharacteristic.value!.write(newPacket);
    }
  }
}
