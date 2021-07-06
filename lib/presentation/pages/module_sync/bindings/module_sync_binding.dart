import 'package:get/get.dart';
import 'package:wattway_by_colas/application/module_sync/module_sync_controller.dart';

class ModuleSyncBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ModuleSyncController>(
      ModuleSyncController(
        storageService: Get.find(),
        bluetoothService: Get.find(),
        firebaseService: Get.find(),
      ),
    );
  }
}
