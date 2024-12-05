import 'package:dartz/dartz.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/repos/auth_repo.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/user_model.dart';
import 'package:yourseatgraduationproject/services/failure_service.dart';

import '../../../../../data/hive_stroage.dart';
import '../../../../../utils/app_logs.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<FailureService, GoogleUserModel>> signInWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signInWithGoogle();

      await HiveStorage.saveGoogleUser(user);

      return Right(user);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, GoogleUserModel>> signInWithFacebook() async {
    try {
      final user = await authRemoteDataSource.signInWithFacebook();
      return Right(user);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, String>> checkUserExists(
      String userId, String password) async {
    try {
      final result =
          await authRemoteDataSource.checkUserExists(userId, password);
      return Right(result);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<void> checkUserExistsR(String phone) async {
    try {
      await authRemoteDataSource.checkUserExistsR(phone);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveUser({
    required String username,
    required String phone,
    required String password,
    required String birthDate,
  }) async {
    try {

       await HiveStorage.saveDefaultUser(UserModel(name: username, email: phone, password: password, dateOfBirth: birthDate));


      await authRemoteDataSource.saveUserToFireStore(
        username: username,
        phone: phone,
        password: password,
        birthDate: birthDate,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendOtp(String phoneNumber, Function(String) onCodeSent) async {
    try {
      await authRemoteDataSource.signInWithPhoneNumber(phoneNumber, onCodeSent);
    } catch (e) {
      rethrow;
    }
  }
}

