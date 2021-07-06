import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/graph/shared/custom_chart.dart';

class GraphDataVisualization extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100, top: 10),
        child: GetBuilder<StatisticController>(
          id: "graph_data_visu",
          init: controller,
          builder: (controller) => Column(
            children: [
              CustomChart(
                title: "Charge de la Batterie",
                size: 150,
                minMaxValues: MinMaxValues(
                  maxX: 7,
                  maxY: 100,
                ),
                horizontalTiles: {},
                verticalTiles: {
                  0: '0%',
                  25: '25%',
                  50: '50%',
                  75: '75%',
                  100: '100%',
                },
                data: [60, 70, 80, 95, 100, 70, 80, 90],
              ),
              const SizedBox(height: 15),
              CustomChart(
                title: "Santé de la Batterie",
                size: 150,
                minMaxValues: MinMaxValues(
                  maxX: 7,
                  maxY: 100,
                ),
                horizontalTiles: {},
                verticalTiles: {
                  0: '0%',
                  25: '25%',
                  50: '50%',
                  75: '75%',
                  100: '100%',
                },
                data: [86, 83, 82, 82, 82, 83, 82, 82],
              )
            ],
          ),
        ),
      ),
    );
  }
}
