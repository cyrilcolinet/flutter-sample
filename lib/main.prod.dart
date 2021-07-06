import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wattway_by_colas/infrastructure/core/bluetooth/bluetooth_service.dart';
import 'package:wattway_by_colas/infrastructure/core/bluetooth/wattway_protocol.dart';
import 'package:wattway_by_colas/infrastructure/core/firebase_service.dart';
import 'package:wattway_by_colas/infrastructure/core/storage_service.dart';
import 'package:wattway_by_colas/presentation/app_widget.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(AppWidget());
}

Future<void> _initServices() async {
  Logger.write('Starting services...');
  await Firebase.initializeApp();
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => BluetoothService().init());
  await Get.putAsync(() => WattwayProtocol().init());
  await Get.putAsync(() => FirebaseService().init());
  Logger.write('All services started...');
}
