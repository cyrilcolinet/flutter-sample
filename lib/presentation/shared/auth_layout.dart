import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_seed/presentation/core/theme/app_colors.dart';
import 'package:flutter_sample_seed/presentation/core/utils/keyboard_utils.dart';

class AuthLayout extends StatelessWidget {
  AuthLayout({required this.child, this.bottomBarWidget});

  final Widget child;
  final Widget? bottomBarWidget;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Container(
      color: Color(fillColor),
      child: Scaffold(
        extendBody: bottomBarWidget != null,
        bottomNavigationBar: bottomBarWidget,
        body: GestureDetector(
          onTap: () => KeyboardUtils.hide(context),
          child: child,
        ),
      ),
    );
  }
}
