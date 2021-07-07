import 'dart:async';

import 'package:flutter_sample_seed/presentation/core/utils/logger_utils.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  Future<FirebaseService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }
}
