import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_value_card.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_value_properties.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/pages/setting/widgets/setting_configuration_bottomsheet.dart';

class SettingCard extends GetView<SettingController> {
  final SettingValueCard cardValue;
  final SettingValueProperties cardValueProperties;

  SettingCard({required this.cardValue, required this.cardValueProperties});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.bottomSheet(
            Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                      ),
                    ),
                    child: SettingConfigurationBottomSheet(
                      categoryName:
                          'setting_category_${EnumToString.convertToString(controller.category)}'
                              .tr,
                      value: cardValue,
                      valueProperties: cardValueProperties,
                    ),
                  ),
                ),
              ],
            ),
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );

          /*Get.defaultDialog(
            title: controller.categoryName + " - " + cardValue.title,
            buttonColor: Color(primaryColor),
            cancelTextColor: Color(primaryColor),
            textConfirm: 'Enregistrer',
            textCancel: 'Annuler',
            radius: 10,
            titleStyle: Get.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
            content: ,
          );*/
        },
        splashColor: const Color(greyColor).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: cardValue.valueDisplay(cardValueProperties.value) + " ",
                      style: Get.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                      children: [
                        TextSpan(
                          text: cardValue.unity,
                          style: Get.textTheme.subtitle1!.copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'setting_value_${EnumToString.convertToString(cardValue.property)}'.tr,
                    style: TextStyle(fontSize: 13, color: Color(0xff7C828A)),
                  ),
                ],
              ),
              Icon(
                LineIcons.pen,
                color: Color(greyColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
