import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/dashboard/dashboard_controller.dart';
import 'package:wattway_by_colas/presentation/shared/custom_title.dart';
import 'package:wattway_by_colas/presentation/shared/title_with_subtitle.dart';

class ModuleConnectivityStatus extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: 'Informations sur le Module'),
        const SizedBox(height: 5),
        SizedBox(
          width: Get.width - 30,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        child: TitleWithSubtitle(
                          title: 'Nom',
                          subtitle: 'Module n°1',
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 3,
                        child: TitleWithSubtitle(
                          title: 'Identifiant',
                          subtitle: '#6482BCOL',
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (Get.width / 3) * 2,
                        child: TitleWithSubtitle(
                          title: 'Status de la connexion',
                          subtitle: 'Connecté, signal fort',
                        ),
                      ),
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Color(0xff5FE698),
                        size: 35,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
