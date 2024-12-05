import 'package:dartz/dartz.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/services/failure_service.dart';

abstract class AuthRepo {
  Future<Either<FailureService, GoogleUserModel>> signInWithGoogle();
  Future<Either<FailureService, GoogleUserModel>> signInWithFacebook();
  Future<Either<FailureService, String>> checkUserExists(
      String userId, String password);
  Future<void> checkUserExistsR(String phone);
  Future<void> saveUser({
    required String username,
    required String phone,
    required String password,
    required String birthDate,
  });
  Future<void> sendOtp(String phoneNumber, Function(String) onCodeSent);
}
