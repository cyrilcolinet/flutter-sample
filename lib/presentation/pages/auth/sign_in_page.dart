import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattway_by_colas/presentation/core/utils/assets_utils.dart';
import 'package:wattway_by_colas/presentation/core/utils/keyboard_utils.dart';
import 'package:wattway_by_colas/presentation/pages/auth/widgets/sign_in_body.dart';
import 'package:wattway_by_colas/presentation/shared/auth_layout.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final keyboardVisible = KeyboardUtils.isShowing(context);

    return AuthLayout(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!keyboardVisible)
                      FadeIn(
                        child: SvgPicture.asset(
                          AssetsUtils.svg('logo_block_2'),
                        ),
                      ),
                    const SizedBox(height: 50),
                    SigninBody(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
