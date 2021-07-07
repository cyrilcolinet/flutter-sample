import 'package:flutter_sample_seed/presentation/core/utils/logger_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final GetStorage box = GetStorage();

  Future<StorageService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  /// Methods that get token or other
  ///
  /// Example: read the access token previously stored
  /// in the box storage
  ///
  /// String getAccessToken() {
  ///   return box.read('accessToken');
  /// }
}
