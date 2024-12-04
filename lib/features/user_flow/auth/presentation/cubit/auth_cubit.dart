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
    emit(AuthLoading());
    final response = await authRepo.signInWithGoogle();

    response.fold(
      // (failure) => emit(GoogleAuthError(failure.errorMsg)),
      (failure) => emit(
          GoogleAuthError("Sorry there was an error , please try again later")),

      (user) => emit(GoogleAuthSuccess(user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(AuthLoading());
    final response = await authRepo.signInWithFacebook();

    response.fold(
      // (failure) => emit(FacebookAuthError(failure.errorMsg)),
      (failure) => emit(FacebookAuthError(
          "Sorry there was an error , please try again later")),
      (user) => emit(FacebookAuthSuccess(user)),
    );
  }

  Future<void> validateUser(String userId, String password) async {
    emit(AuthLoading());
    var response = await authRepo.checkUserExists(userId, password);

    response.fold((failure) => emit(UserValidationError(failure.errorMsg)),
        (message) {
      if (message == "LoginSuccessful") {
        emit(UserValidationSuccess(message));
      } else {
        if (message == "User does not exist or password is incorrect") {
          emit(UserValidationError(message));
        } else {
          emit(UserValidationError(
              "Sorry there was an error , please try again later"));
        }
      }
    });
  }

  Future<void> registerUser({
    required String username,
    required String phone,
    required String password,
    required String birthDate,
  }) async {
    try {
      emit(AuthLoading());
      await authRepo.checkUserExistsR(phone);
      print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
      await authRepo.saveUser(
        username: username,
        phone: phone,
        password: password,
        birthDate: birthDate,
      );
      emit(AuthSuccess());
    } catch (e) {
      print(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      emit(AuthLoading());
      await authRepo.sendOtp(phoneNumber, (verificationId) {
        emit(OtpSent(verificationId));
      });
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

