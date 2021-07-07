import 'package:get/get.dart';
import 'package:flutter_sample_seed/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_sample_seed/infrastructure/core/service/storage_service.dart';

class AuthRepository implements IAuthRepository {
  StorageService storageService = Get.find();
}
