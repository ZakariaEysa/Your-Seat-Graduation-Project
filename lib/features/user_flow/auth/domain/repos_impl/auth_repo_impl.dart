import 'package:dartz/dartz.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/repos/auth_repo.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/services/failure_service.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<FailureService, UserModel>> signInWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signInWithGoogle();
      return Right(user);
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, UserModel>> signInWithFacebook() async {
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
}
