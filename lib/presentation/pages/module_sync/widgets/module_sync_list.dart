import 'package:dartz/dartz.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wattway_by_colas/application/module_sync/module_sync_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class ModuleSyncList extends GetView<ModuleSyncController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width + 100,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
        itemCount: controller.scanResults.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          Tuple2<String, ScanResult> res = controller.scanResults.elementAt(index);
          BluetoothRssi rssi = controller.getSignalStrength(res.value2.rssi);

          return Card(
            margin: EdgeInsets.zero,
            child: InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              onTap: () => controller.startConnectionToDevice(res.value2),
              splashColor: const Color(greyColor).withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          res.value1,
                          style: Get.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "module_sync_rssi_${EnumToString.convertToString(rssi)}".tr,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color((() {
                              switch (rssi) {
                                case BluetoothRssi.unusable:
                                  return redColor;
                                case BluetoothRssi.low:
                                  return warnColor;
                                case BluetoothRssi.medium:
                                  return greenColor;
                                case BluetoothRssi.high:
                                  return greenColor;
                              }
                            })()),
                          ),
                        ),
                        Text(
                          "#${res.value2.device.id.id}",
                          style: Get.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Color(greyColor),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isConnecting.value,
                        child: const SizedBox(
                          height: 27,
                          width: 27,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(greyColor)),
                          ),
                        ),
                        replacement: Icon(
                          LineIcons.arrowRight,
                          color: Color(greyColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
