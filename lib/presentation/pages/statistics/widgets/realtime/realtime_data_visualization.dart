import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/realtime/shared/basic_data_card.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/realtime/shared/disabled_card.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/realtime/shared/progress_data_card.dart';

class RealtimeDataVisualization extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      height: Get.height - 100,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Obx(
          () => StaggeredGridView.countBuilder(
            crossAxisCount: 12,
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: controller.categoryDatas.length,
            itemBuilder: (BuildContext context, int index) => Obx(
              () {
                if (!controller.isLoading.value) {
                  if (controller.currentData.isEmpty) return Container();

                  final sampleSet = controller.categoryDatas[index];
                  final dataProperties = controller.currentData
                      .firstWhere((cat) => cat.property == sampleSet.property);

                  if (sampleSet.unity == '%') {
                    return ProgressDataCard(
                      dataSet: sampleSet,
                      dataSetProperties: dataProperties,
                    );
                  } else if (dataProperties.disabled) {
                    return DisabledCard(dataSet: sampleSet);
                  }

                  return BasicDataCard(
                    dataSet: sampleSet,
                    dataSetProperties: dataProperties,
                  );
                }

                return Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Material(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      color: Colors.white,
                      child: Container(height: 80),
                    ),
                  ),
                );
              },
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(
              controller.categoryDatas[index].axisSize,
            ),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ),
    );
  }
}
