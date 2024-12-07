import 'package:dartz/dartz.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/services/failure_service.dart';

import '../../domain/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<FailureService, GoogleUserModel>> signInWithGoogle();
  Future<Either<FailureService, GoogleUserModel>> signInWithFacebook();
  Future<Either<FailureService, String>> checkUserExists(
      String userId, String password);
  Future<void> checkUserExistsR(String email);
  Future<void> saveUser({
    required UserModel userModel,
  });
  Future<void> sendOtp(String phoneNumber, Function(String) onCodeSent);
}
