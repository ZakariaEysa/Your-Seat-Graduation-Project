import 'package:dartz/dartz.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/services/failure_service.dart';

abstract class AuthRepo {
  Future<Either<FailureService, UserModel>> signInWithGoogle();
  Future<Either<FailureService, UserModel>> signInWithFacebook();
  Future<Either<FailureService, String>> checkUserExists(
      String userId, String password);
}
