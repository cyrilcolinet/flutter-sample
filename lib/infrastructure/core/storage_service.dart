import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';

class StorageService extends GetxService {
  final GetStorage box = GetStorage();

  Future<StorageService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }
}
