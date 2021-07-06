import 'package:get/get.dart';
import 'package:wattway_by_colas/presentation/pages/auth/bindings/signin_binding.dart';
import 'package:wattway_by_colas/presentation/pages/auth/sign_in_page.dart';
import 'package:wattway_by_colas/presentation/pages/home/bindings/home_binding.dart';
import 'package:wattway_by_colas/presentation/pages/home/home_page.dart';
import 'package:wattway_by_colas/presentation/pages/module_sync/bindings/module_sync_binding.dart';
import 'package:wattway_by_colas/presentation/pages/module_sync/module_sync_page.dart';
import 'package:wattway_by_colas/presentation/pages/splash/bindings/splash_binding.dart';
import 'package:wattway_by_colas/presentation/pages/splash/splash_page.dart';

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
    GetPage(
      name: Routes.module_sync,
      page: () => ModuleSyncPage(),
      binding: ModuleSyncBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
