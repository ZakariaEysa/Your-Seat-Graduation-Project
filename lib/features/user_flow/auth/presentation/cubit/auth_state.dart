part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// Google Authentication States
final class GoogleAuthLoading extends AuthState {}
final class GoogleAuthSuccess extends AuthState {
  final UserModel user;
  GoogleAuthSuccess(this.user);
}
final class GoogleAuthError extends AuthState {
  final String errorMsg;
  GoogleAuthError(this.errorMsg);
}

// Facebook Authentication States
final class FacebookAuthLoading extends AuthState {}
final class FacebookAuthSuccess extends AuthState {
  final UserModel user;
  FacebookAuthSuccess(this.user);
}
final class FacebookAuthError extends AuthState {
  final String errorMsg;
  FacebookAuthError(this.errorMsg);
}

// User Validation States (Check User Exists)
final class UserValidationLoading extends AuthState {}
final class UserValidationSuccess extends AuthState {
  final String message;
  UserValidationSuccess(this.message);
}
final class UserValidationError extends AuthState {
  final String error;
  UserValidationError(this.error);
}
