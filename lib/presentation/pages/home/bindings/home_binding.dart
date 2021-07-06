import 'package:get/get.dart';
import 'package:wattway_by_colas/application/dashboard/dashboard_controller.dart';
import 'package:wattway_by_colas/application/home/home_controller.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/application/statistics/statistic_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());

    // Statistics
    Get.lazyPut<StatisticController>(() => StatisticController());

    // Settings
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
