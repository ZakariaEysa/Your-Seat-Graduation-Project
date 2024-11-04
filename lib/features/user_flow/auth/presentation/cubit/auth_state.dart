part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class GoogleAuthLoading extends AuthState {}
final class GoogleAuthSuccess extends AuthState {

  final UserModel user;
  GoogleAuthSuccess(this.user);


}
final class GoogleAuthError extends AuthState {

  final String errorMsg;
  GoogleAuthError(this.errorMsg);

}

