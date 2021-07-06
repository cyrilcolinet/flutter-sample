import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class DataVisualizationTypeDropdown extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down),
        value: controller.viewType.value,
        iconSize: 24,
        elevation: 16,
        style: Get.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        underline: Container(
          height: 1,
          color: Color(primaryColor),
        ),
        onChanged: (String? val) => controller.viewType.value = val!,
        items: ['statistic_visu_type_realtime', 'statistic_visu_type_graph']
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value.split('_').last,
                child: Text(value.tr),
              ),
            )
            .toList(),
      ),
    );
  }
}
