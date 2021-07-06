import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wattway_by_colas/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:wattway_by_colas/domain/auth/failures/auth_failure.dart';
import 'package:wattway_by_colas/infrastructure/core/firebase_service.dart';
import 'package:wattway_by_colas/infrastructure/core/storage_service.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required this.firebaseService,
    required this.storageService,
  });

  FirebaseService firebaseService;
  StorageService storageService;

  @override
  Future<Either<AuthFailure, User>> login(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseService.auth.signInWithEmailAndPassword(email: email, password: password);

      return right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.notFound());
      } else if (e.code == 'user-disabled') {
        return left(const AuthFailure.userDisabled());
      }

      return left(const AuthFailure.unexpected());
    }
  }
}
