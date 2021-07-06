import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/domain/statistics/models/realtime_data_set.dart';

class DisabledCard extends StatelessWidget {
  final RealtimeDataSet dataSet;

  DisabledCard({required this.dataSet});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "n/a",
                style: Get.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
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
