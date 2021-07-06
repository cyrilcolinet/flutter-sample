import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/shared/get_view_with_hook.dart';

class SigninForm extends GetViewWithHook<SigninController> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _passwordVisible = useState<bool>(false);
    return FormBuilder(
      key: controller.signinForm,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: controller.emailTextController,
            name: "email",
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context, errorText: 'error_form_required'.tr),
              FormBuilderValidators.email(context, errorText: 'error_form_email'.tr),
            ]),
            decoration: InputDecoration(
              labelText: "form_email".tr,
              fillColor: Colors.white,
              prefixIcon: Icon(
                LineIcons.envelope,
                color: Color(greyColor),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FormBuilderTextField(
            controller: controller.passwordTextController,
            name: "password",
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            obscureText: !_passwordVisible.value,
            decoration: InputDecoration(
              labelText: "form_password".tr,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                LineIcons.lock,
                color: Color(greyColor),
              ),
              suffixIcon: GestureDetector(
                onTap: () => _passwordVisible.value = !_passwordVisible.value,
                child: Icon(
                  _passwordVisible.value ? LineIcons.eyeSlash : LineIcons.eye,
                  color: Colors.grey,
                ),
              ),
            ),
            validator: FormBuilderValidators.required(
              context,
              errorText: 'error_form_required'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
