import 'package:get/get.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(
      SigninController(
        authRepository: Get.find(),
        firebaseService: Get.find(),
      ),
    );
  }
}
