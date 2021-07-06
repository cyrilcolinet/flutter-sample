import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/module_sync/module_sync_controller.dart';
import 'package:wattway_by_colas/presentation/shared/rounded_button.dart';

class ModuleSyncEmptyList extends GetView<ModuleSyncController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: Get.height / 3,
      child: FadeIn(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "module_sync_not_found".tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline2,
            ),
            const SizedBox(height: 30),
            RoundedButton(
              onPressed: controller.scanForBluetoothDevices,
              label: 'retry'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
