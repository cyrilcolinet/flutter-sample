import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';
import 'package:wattway_by_colas/domain/statistics/enum/statistic_category.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/data_visualization_type_dropdown.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/graph/graph_data_visualization.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/graph_zoom_dropdown.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/realtime/realtime_data_visualization.dart';
import 'package:wattway_by_colas/presentation/pages/statistics/widgets/statistic_app_bar.dart';

class StatisticPage extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    controller.homeController.floatingCallback =
        () => controller.fetchNewCategoryData(controller.currentCategory());

    return DefaultTabController(
      length: StatisticCategory.values.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: StatisticAppBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DataVisualizationTypeDropdown(),
                          GraphZoomDropdown(),
                        ],
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.viewType.value == 'realtime',
                          child: RealtimeDataVisualization(),
                          replacement: GraphDataVisualization(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
