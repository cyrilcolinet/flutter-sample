import 'package:get/get.dart';
import 'package:flutter_sample_seed/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_sample_seed/infrastructure/auth/auth_repository.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(),
      fenix: true,
    );
  }
}
