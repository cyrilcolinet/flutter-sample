import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/normal_settings_cards.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/subcategory_settings_cards.dart';

class SettingCards extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      height: Get.height,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Obx(
          () => (() {
            if (controller.categoryDatas != null)
              return NormalSettingsCards();
            else if (controller.subCategories != null) return SubCategorySettingsCards();
            return Container();
          })(),
        ),
      ),
    );
  }
}
