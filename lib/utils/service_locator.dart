import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  // getIt.registerSingleton<ApiService>(
  //   ApiService(
  //     dio: Dio(),
  //   ),
  // );
  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
      AuthRemoteDataSourceImpl(FirebaseAuth.instance, GoogleSignIn()));
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt<AuthRemoteDataSourceImpl>()),
  );
}
