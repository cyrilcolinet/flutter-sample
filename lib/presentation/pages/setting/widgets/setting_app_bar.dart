import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/domain/setting/enum/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_category.dart';
import 'package:wattway_by_colas/domain/setting/models/settings_values.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/core/utils/assets_utils.dart';
import 'package:wattway_by_colas/presentation/pages/auth/widgets/logout_bottom_sheet.dart';
import 'package:wattway_by_colas/presentation/shared/bubble_tab_indicator.dart';
import 'package:wattway_by_colas/presentation/shared/colored_tab_bar.dart';

class SettingAppBar extends GetView<SettingController> implements PreferredSizeWidget {
  final SigninController signinController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(color: Color(primaryColor)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                transform: Matrix4.translationValues(90.0, -20, 0.0),
                child: SvgPicture.asset(
                  AssetsUtils.svg('top_background_logos'),
                ),
              ),
            ),
            AppBar(
              toolbarHeight: preferredSize.height - 60,
              automaticallyImplyLeading: false,
              centerTitle: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () => Get.bottomSheet(
                      LogoutBottomSheet(),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.power_settings_new,
                      size: 30,
                      color: Color(errorColor),
                    ),
                  ),
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'setting_page_title'.tr,
                      style: Get.textTheme.headline1!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Connecté',
                      style: Get.textTheme.subtitle2!.copyWith(
                        color: Color(0xff5FE698),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: ColoredTabBar(
                color: Colors.white,
                tabBar: TabBar(
                  onTap: (int newIndex) {
                    controller.currentCategory.value =
                        SettingCategoryType.values.elementAt(newIndex + 2);
                  },
                  unselectedLabelColor: const Color(textColor),
                  labelColor: Colors.white,
                  indicator: const BubbleTabIndicator(
                    indicatorHeight: 22,
                    indicatorColor: Color(textColor),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  ),
                  isScrollable: true,
                  labelStyle: Get.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: <Tab>[
                    ...settingsValues.map(
                      (SettingCategory settingCategory) => Tab(
                        child: Row(
                          children: [
                            Icon(settingCategory.icon, size: 15),
                            const SizedBox(width: 5),
                            Text(
                              'setting_category_${EnumToString.convertToString(settingCategory.category)}'
                                  .tr,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height / 13 + 50.0); // TODO: Add kpi
}
