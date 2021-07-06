import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";
import 'package:wattway_by_colas/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:wattway_by_colas/domain/auth/failures/auth_failure.dart';
import 'package:wattway_by_colas/infrastructure/core/firebase_service.dart';
import 'package:wattway_by_colas/presentation/core/utils/snack_bar_utils.dart';
import 'package:wattway_by_colas/presentation/routes/app_pages.dart';

class SigninController extends GetxController {
  SigninController({
    required this.authRepository,
    required this.firebaseService,
  });

  final IAuthRepository authRepository;
  final FirebaseService firebaseService;

  final RxBool isLoading = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  late GlobalKey<FormBuilderState> signinForm;

  void onInit() {
    signinForm = GlobalKey<FormBuilderState>();
    super.onInit();
  }

  // Login by using firebase authentication
  Future<void> login() async {
    isLoading.value = true;
    final Either<AuthFailure, User> failureOrUser =
        await this.authRepository.login(emailTextController.text, passwordTextController.text);

    failureOrUser.fold(
      (AuthFailure left) {
        isLoading.value = false;
        left.map(
          unexpected: (_) => SnackBarUtils.error(
            message: 'http_error_unexpected',
          ),
          userDisabled: (_) => SnackBarUtils.error(
            message: 'http_error_user_disabled',
          ),
          notFound: (_) => SnackBarUtils.error(
            message: 'http_error_user_not_found',
          ),
        );
      },
      (User right) {
        isLoading.value = false;
        Get.offAllNamed(Routes.module_sync);
      },
    );
  }

  void logout() {
    final User? user = firebaseService.getUser();
    if (user != null) {
      firebaseService.auth.signOut();
    }

    Get.offAllNamed(Routes.signin);
  }
}
