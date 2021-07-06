import 'package:get/get.dart';
import 'package:wattway_by_colas/application/auth/signin_controller.dart';
import 'package:wattway_by_colas/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:wattway_by_colas/infrastructure/auth/auth_repository.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(
        firebaseService: Get.find(),
        storageService: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<SigninController>(
      () => SigninController(
        authRepository: Get.find(),
        firebaseService: Get.find(),
      ),
      fenix: true,
    );
  }
}
