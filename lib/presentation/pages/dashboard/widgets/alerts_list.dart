import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/dashboard/dashboard_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/shared/custom_title.dart';

class AlertsList extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: 'Etat des Alarmes'),
        const SizedBox(height: 5),
        SizedBox(
          width: Get.width - 30,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Batterie',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Coupure brutable de courant',
                    style: Get.textTheme.headline2!.copyWith(color: Color(errorColor)),
                  ),
                  Divider(
                    color: Color(greyColor),
                    height: 25,
                  ),
                  Text(
                    'Panneau Voltaïque',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Détection coupure brutale d\'énergie',
                    style: Get.textTheme.headline2!.copyWith(color: Color(errorColor)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
