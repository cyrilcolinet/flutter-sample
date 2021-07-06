import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';
import 'package:wattway_by_colas/presentation/shared/rounded_button.dart';

class LogoutBottomSheet extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text("Déconnexion", style: Get.textTheme.headline1),
          const SizedBox(height: 20),
          RoundedButton(
            onPressed: () {},
            label: "Se Déconnecter du Module",
          ),
          const SizedBox(height: 10),
          RoundedButton(
            onPressed: controller.logout,
            colors: [
              Color(0xffFF3C2B),
              Color(0xffDB1F1F),
            ],
            label: "Déconnexion Totale",
          ),
        ],
      ),
    );
  }
}
