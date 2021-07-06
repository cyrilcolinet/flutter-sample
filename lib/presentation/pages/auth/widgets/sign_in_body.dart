import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';
import 'package:wattway_by_colas/presentation/pages/auth/widgets/sign_in_form.dart';
import 'package:wattway_by_colas/presentation/shared/auth_title_subtitle.dart';
import 'package:wattway_by_colas/presentation/shared/rounded_button.dart';

class SigninBody extends GetView<SigninController> {
  Future<void> login() async {
    if (controller.signinForm.currentState!.saveAndValidate()) {
      await controller.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AuthTitleSubtitle(
          title: 'auth_signin_title'.tr,
          subtitle: 'auth_signin_subtitle'.tr,
        ),
        const SizedBox(height: 30),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Column(
            children: [
              SigninForm(),
              const SizedBox(height: 30),
              Obx(
                () => RoundedButton(
                  onPressed: login,
                  isLoading: controller.isLoading.value,
                  label: 'signin'.tr,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}
