import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_sample_seed/infrastructure/core/firebase_service.dart';
import 'package:flutter_sample_seed/infrastructure/core/storage_service.dart';
import 'package:flutter_sample_seed/presentation/app_widget.dart';
import 'package:flutter_sample_seed/presentation/core/utils/logger_utils.dart';

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
  await Get.putAsync(() => FirebaseService().init());
  Logger.write('All services started...');
}
