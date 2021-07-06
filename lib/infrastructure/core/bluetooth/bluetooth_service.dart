import 'dart:async';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_blue/flutter_blue.dart' as bt;
import 'package:get/get.dart';
import 'package:wattway_by_colas/domain/setting/enum/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/models/settings_values.dart';
import 'package:wattway_by_colas/infrastructure/core/bluetooth/enum/command_type.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';
import 'package:wattway_by_colas/presentation/core/utils/snack_bar_utils.dart';
import 'package:wattway_by_colas/presentation/routes/app_pages.dart';

class BluetoothService extends GetxService {
  final bt.Guid serviceUuid = bt.Guid("00005700-cc7a-482a-984a-7f2ed5b3e58f");
  final bt.Guid nameCharacteristicUuid = bt.Guid("00005703-8e22-4541-9d4c-21edae82ed19");
  final int maxBytesLength = 20;
  final List<int> magicKey = [0xFB, 0xFA];
  final ByteData magicBytes = ByteData.view(Uint8List.fromList([0xFB, 0xFA]).buffer);

  final bt.FlutterBlue flutterBlue = bt.FlutterBlue.instance;

  final Rxn<bt.BluetoothDevice> connectedDevice = Rxn(null);
  final Rxn<bt.BluetoothCharacteristic> readCharacteristic = Rxn(null);
  final Rxn<bt.BluetoothCharacteristic> writeCharacteristic = Rxn(null);
  final Rxn<ByteData> byteData = Rxn(null);

  late StreamSubscription _stateSubscriber;
  late StreamSubscription _subscriber;

  // In progress transaction
  final RxList<int> endedTransactionPacket = RxList([]);
  final RxBool transactionInProgress = false.obs;
  late int _totalDataLength = 0;
  late int _nextTransactionIndex = 0;
  late List<int> _currentTransaction = [];

  /// When the service starts
  ///
  /// Setting the log level to error only and remove debug prints from
  /// flutter_blue package
  Future<BluetoothService> init() async {
    Logger.write('$runtimeType ready!');
    (await flutterBlue.connectedDevices).forEach((device) => device.disconnect());
    flutterBlue.setLogLevel(bt.LogLevel.critical);
    return this;
  }

  /// When the service closes
  ///
  /// When service closed, need to close connection, remove and cancel
  /// all subscribers and restore default values
  Future<void> onClose() async {
    _disconnectAll();
    (await flutterBlue.connectedDevices).forEach((device) => device.disconnect());
    super.onClose();
  }

  /// Scan proximity BLE devices with the name of the board
  ///
  /// Returns a list of WATTWAY controllers in proximity
  /// by filtering manufacturer data
  Future<List<Tuple2<String, bt.ScanResult>>> scanLowEnergyProximity() async {
    if (!await flutterBlue.isAvailable) {
      SnackBarUtils.warn(message: "module_sync_not_available");
      return [];
    }

    List<Tuple2<String, bt.ScanResult>> finalResults = [];
    List<bt.ScanResult> scanRes = await flutterBlue
        .scan(timeout: Duration(seconds: 4))
        .where((result) => result.device.name == "WATTWAY")
        .toList();

    await Future.forEach(scanRes, (bt.ScanResult result) async {
      await result.device.connect();
      final allServices = await result.device.discoverServices();
      final service = allServices.firstWhere((e) => e.uuid == serviceUuid);

      await Future.forEach(service.characteristics, (bt.BluetoothCharacteristic char) async {
        if (char.uuid == nameCharacteristicUuid) {
          final boardName = (await char.read()).map((e) => String.fromCharCode(e)).join("");
          finalResults.add(Tuple2(boardName, result));
          await result.device.disconnect();
        }
      });
    });

    return finalResults;
  }

  /// Initialize connection to the device by the [bt.ScanResult] [result]
  /// of the research
  ///
  /// Creates two subscribers [_subscriber] for the notify response from BLE
  /// [connectedDevice] and [_stateSubscriber] used to determine if
  /// the device are disconnected or not
  Future<void> connectToDevice(bt.ScanResult result) async {
    if (connectedDevice.value != null) return;

    try {
      await result.device.connect(timeout: Duration(seconds: 5));
      connectedDevice.value = result.device;
      _stateSubscriber = connectedDevice.value!.state.listen((state) {
        if (state == bt.BluetoothDeviceState.disconnected) {
          SnackBarUtils.error(message: "module_sync_connection_lost");
          _disconnectAll();
          if (Get.currentRoute != Routes.module_sync) Get.offAllNamed(Routes.module_sync);
          _stateSubscriber.cancel();
        }
      });

      if (connectedDevice.value == null) {
        return Future.error("Device is not discoverable");
      }

      final allServices = await connectedDevice.value!.discoverServices();
      final service = allServices.firstWhere((e) => e.uuid == serviceUuid);

      service.characteristics.forEach((char) {
        if (char.properties.notify) {
          char.setNotifyValue(true);
          _subscriber = char.value.listen(_notifyListener);
        } else if (char.properties.read) {
          readCharacteristic.value = char;
        } else if (char.properties.write) {
          writeCharacteristic.value = char;
        }
      });
    } catch (err) {
      return Future.error(err);
    }
  }

  /// Send [command] as packet [raw] to wattway board
  ///
  /// This method allow user to send any command of the
  /// protocol (only command defined in [CommandType] are allowed)
  /// and received answer from the board
  Future<void> sendPacket(CommandType command, {required List<int> raw}) async {
    List<int> initialPacket = [
      ...magicKey,
      ...Uint8List.view(Uint16List.fromList([raw.length]).buffer),
      command.toByte(),
      ...raw,
    ];

    int packetAmount = (initialPacket.length / maxBytesLength).ceil();
    for (int index = 0; index <= packetAmount; index++) {
      List<int> packet = initialPacket.take(maxBytesLength).toList();
      if (index > 0) {
        packet.insertAll(0, [index, 0]);
        if (index != packetAmount) {
          if (initialPacket.length < maxBytesLength - 2) {
            initialPacket.clear();
          } else {
            initialPacket.removeRange(0, maxBytesLength - 2);
          }
        }
      } else {
        if (initialPacket.length < maxBytesLength) {
          initialPacket.clear();
        } else {
          initialPacket.removeRange(0, maxBytesLength);
        }
      }

      if (packet.length == 2) continue;
      Uint8List newPacket = Uint8List(20);
      newPacket.setAll(0, packet.take(maxBytesLength).toList());
      Get.log("[BT] sending message hex: 0x" + hex.encode(newPacket));
      await writeCharacteristic.value!.write(newPacket);
    }
  }

  /// Get parameter value by tag
  // TODO: Implements bluetooth
  Future<String> getParameterValue(
    SettingCategoryType category,
    String tag,
  ) async {
    return Future.value("Unknown");
  }

  /// Notify the listener for a new response with [values]
  /// as a [List] of integer (same as [Uint8List])
  ///
  /// First of all just try to catch the transaction begins and
  /// get the auxiliaries transactions
  /// When request is complete, fill the [finalPacketBytes] array
  /// with the concatenated bytes list excepted the index two first bytes.
  void _notifyListener(List<int> values) async {
    if (values.isEmpty) return;

    Uint8List bytes = Uint8List.fromList(values);
    ByteData firstBytes = ByteData.view(bytes.buffer, 0, 2);
    //ByteData command = ByteData.view(bytes.buffer, 4, 1);
    Get.log("[BT] notify hex: 0x" + hex.encode(bytes.toList()));

    if (firstBytes.getInt16(0) == magicBytes.getInt16(0) && transactionInProgress.isFalse) {
      transactionInProgress(true);
      endedTransactionPacket([]);
      Get.log("[BT] begin reception - packet 0");

      ByteData totalDataLength = ByteData.view(bytes.buffer, 2, 2);
      _totalDataLength = totalDataLength.getUint16(0, Endian.little) + 5;
      _currentTransaction.addAll(bytes);
    } else {
      if (firstBytes.getUint16(0, Endian.little) != _nextTransactionIndex) {
        _cancelAndResetTransaction();
        return;
      }
      Get.log("[BT] complete reception - packet " + _nextTransactionIndex.toString());
      _currentTransaction.addAll(bytes.skip(2));
    }

    if (_currentTransaction.length < _totalDataLength) {
      _nextTransactionIndex++;
      return;
    }

    if (transactionInProgress.isTrue) {
      //_currentTransaction.removeRange(_totalDataLength, _currentTransaction.length);
      endedTransactionPacket(_currentTransaction);
      transactionInProgress.value = false;
      _currentTransaction.clear();
    }
  }

  /// Disconnect device and reset default data
  ///
  /// Sets the [connectedDevice] and [readCharacteristic] values to null, cancel
  /// all subscriptions ([_subscriber], [_stateSubscriber]) and
  /// disconnect the device
  void _disconnectAll() {
    if (connectedDevice.value != null) {
      connectedDevice.value!.disconnect();
    }
    connectedDevice.value = null;
    readCharacteristic.value = null;
    writeCharacteristic.value = null;
    _subscriber.cancel();
    _stateSubscriber.cancel();
  }

  /// Cancel transaction if errored
  void _cancelAndResetTransaction() {
    _currentTransaction.clear();
    _nextTransactionIndex = 0;
    transactionInProgress.value = false;
    endedTransactionPacket.clear();
    //finalPacketBytes.value = [];
  }
}
