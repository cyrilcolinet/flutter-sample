import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sample_seed/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_sample_seed/infrastructure/core/service/firebase_service.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninController extends GetxController {
  final IAuthRepository authRepository = Get.find();
  final FirebaseService firebaseService = Get.find();

  final RxBool isLoading = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  late GlobalKey<FormBuilderState> signinForm;

  void onInit() {
    signinForm = GlobalKey<FormBuilderState>();
    super.onInit();
  }
}
