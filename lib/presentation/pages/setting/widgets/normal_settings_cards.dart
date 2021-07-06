import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/setting_card.dart';

class NormalSettingsCards extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StaggeredGridView.countBuilder(
        crossAxisCount: 12,
        itemCount: controller.categoryDatas!.length,
        itemBuilder: (BuildContext context, int index) {
          if (!controller.isLoading.value) {
            if (controller.currentData.isEmpty) return Container();
            final sampleSet = controller.categoryDatas![index];
            final dataProperties =
                controller.currentData.firstWhere((cat) => cat.property == sampleSet.property);

            return SettingCard(
              cardValue: controller.categoryDatas![index],
              cardValueProperties: dataProperties,
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
        staggeredTileBuilder: (int index) =>
            StaggeredTile.fit(controller.categoryDatas![index].axisSize),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
