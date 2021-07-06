import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set_properties.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class BasicDataCard extends GetView<StatisticController> {
  final RealtimeDataSet dataSet;
  final RealtimeDataSetProperties dataSetProperties;

  BasicDataCard({required this.dataSet, required this.dataSetProperties});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: (dataSet.customDisplay != null
                        ? dataSet.customDisplay!(dataSetProperties.value)
                        : dataSet.valueDisplay(dataSetProperties.value))
                    .toString(),
                style: Get.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: dataSet.colorTransformer(Color(textColor), dataSetProperties.value),
                ),
                children: [
                  TextSpan(text: " "),
                  TextSpan(
                    text: dataSet.unity,
                    style: Get.textTheme.subtitle1!.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            Text(
              "statistic_value_${EnumToString.convertToString(dataSet.property)}".tr,
              style: TextStyle(fontSize: 13, color: Color(0xff7C828A)),
            ),
          ],
        ),
      ),
    );
  }
}
