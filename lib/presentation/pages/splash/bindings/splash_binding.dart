import 'package:get/get.dart';
import 'package:wattway_by_colas/application/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(
      bluetoothService: Get.find(),
      firebaseService: Get.find(),
    ));
  }
}
