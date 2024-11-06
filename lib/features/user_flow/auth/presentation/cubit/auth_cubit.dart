import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/repos/auth_repo.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());
  GlobalKey<FormState> formKeyLogin = GlobalKey();
  GlobalKey<FormState> formKeyRegister = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? selectedMonth;
  int? selectedDay;
  int? selectedYear;
  bool showPassword = true;

  final TextEditingController phoneController = TextEditingController();
  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    final response = await authRepo.signInWithGoogle();

    response.fold(
      (failure) => emit(GoogleAuthError(failure.errorMsg)),
      (user) => emit(GoogleAuthSuccess(user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(FacebookAuthLoading());
    final response = await authRepo.signInWithFacebook();

    response.fold(
      (failure) => emit(FacebookAuthError(failure.errorMsg)),
      (user) => emit(FacebookAuthSuccess(user)),
    );
  }

  Future<void> validateUser(String userId, String password) async {
    emit(UserValidationLoading());
    final response = await authRepo.checkUserExists(userId, password);

    response.fold(
      (failure) => emit(UserValidationError(failure.errorMsg)),
      (message) => emit(UserValidationSuccess(message)),
    );
  }
}
