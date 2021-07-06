import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/domain/setting/enum/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_category.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/setting_card.dart';

class SubCategorySettingsCards extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => DropdownButton<int>(
            icon: Icon(Icons.keyboard_arrow_down),
            value: controller.dropdownSelected.value,
            iconSize: 24,
            elevation: 16,
            style: Get.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
            underline: Container(
              height: 1,
              color: Color(primaryColor),
            ),
            onChanged: (int? val) => controller.dropdownSelected.value = val!,
            items: controller.subCategories!
                .map((e) => e.category)
                .toList()
                .asMap()
                .map(
                  (int index, SettingCategoryType value) => MapEntry(
                    index,
                    DropdownMenuItem<int>(
                      value: index,
                      child: Text(
                        'setting_category_${EnumToString.convertToString(value)}'.tr,
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Obx(
            () => StaggeredGridView.countBuilder(
              crossAxisCount: 12,
              itemCount: controller.subCategoryData!.length,
              itemBuilder: (BuildContext context, int index) {
                if (!controller.isLoading.value) {
                  if (controller.currentData.isEmpty) return Container();
                  final sampleSet = controller.subCategoryData![index];
                  final dataProperties = controller.currentData
                      .firstWhere((cat) => cat.property == sampleSet.property);

                  return SettingCard(
                    cardValue: controller.subCategoryData![index],
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
                  StaggeredTile.fit(controller.subCategoryData![index].axisSize),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        )
      ],
    );
  }
}
