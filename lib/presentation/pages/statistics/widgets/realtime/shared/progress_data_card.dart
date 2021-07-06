import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set_properties.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class ProgressDataCard extends StatelessWidget {
  final RealtimeDataSet dataSet;
  final RealtimeDataSetProperties dataSetProperties;

  ProgressDataCard({required this.dataSet, required this.dataSetProperties});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "statistic_value_${EnumToString.convertToString(dataSet.property)}".tr,
              style: TextStyle(fontSize: 13, color: Color(0xff7C828A)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: dataSetProperties.value / 100,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor:
                      dataSet.colorTransformer(Color(primaryColor), dataSetProperties.value),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: dataSet.valueDisplay(dataSetProperties.value) + " ",
                        style: Get.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                        children: [
                          TextSpan(
                            text: dataSet.unity,
                            style: Get.textTheme.subtitle1!.copyWith(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
