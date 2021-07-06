import 'package:get/get.dart';
import 'package:flutter_sample_seed/application/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
