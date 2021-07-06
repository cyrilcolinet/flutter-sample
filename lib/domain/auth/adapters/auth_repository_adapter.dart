import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wattway_by_colas/domain/auth/failures/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, User>> login(
    String email,
    String password,
  );
}
