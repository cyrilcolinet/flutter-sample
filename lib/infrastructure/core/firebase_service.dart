import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wattway_by_colas/presentation/core/utils/logger_utils.dart';

class FirebaseService extends GetxService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() {
    super.onReady();
  }

  User? getUser() => auth.currentUser;
}
