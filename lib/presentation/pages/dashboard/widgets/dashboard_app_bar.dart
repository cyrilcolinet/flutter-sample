import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/dashboard/dashboard_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/pages/auth/widgets/logout_bottom_sheet.dart';

class DashboardAppBar extends GetView<DashboardController> implements PreferredSizeWidget {
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height - 10,
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
              "Dashboard".tr,
              style: Get.textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
            ),
            Obx(
              () => Text(
                controller.useCase.value ?? "loading".tr,
                style: Get.textTheme.subtitle2!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height / 13); // TODO: Add kpi
}
