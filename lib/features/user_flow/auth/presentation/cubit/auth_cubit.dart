import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/repos/auth_repo.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
final AuthRepo authRepo;




  AuthCubit(this.authRepo) : super(AuthInitial());
  final GlobalKey<FormState> formKeyLogin = GlobalKey();
  final GlobalKey<FormState> formKeyRegister = GlobalKey();
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = true;

  final TextEditingController phoneController = TextEditingController();

  onPressed() {
    showPassword = !showPassword;
  }






  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());

    final response = await authRepo.signInWithGoogle();

    response.fold(
      (failure) => emit(GoogleAuthError(failure.errorMsg)),
      (user) => emit(GoogleAuthSuccess(user)),
    );
  }














}
