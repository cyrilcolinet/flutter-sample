import 'package:flutter/material.dart';
import 'package:flutter_sample_seed/infrastructure/core/middleware/auth_middleware.dart';
import 'package:flutter_sample_seed/presentation/pages/auth/bindings/signin_binding.dart';
import 'package:flutter_sample_seed/presentation/pages/auth/sign_in_page.dart';
import 'package:flutter_sample_seed/presentation/pages/splash/bindings/splash_binding.dart';
import 'package:flutter_sample_seed/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => SigninPage(),
      binding: SigninBinding(),
      transition:
          Get.previousRoute == Routes.splash ? Transition.rightToLeft : Transition.leftToRight,
    ),
    GetPage(name: Routes.home, page: () => Container(), middlewares: [
      AuthMiddleware(),
    ]),
  ];
}
