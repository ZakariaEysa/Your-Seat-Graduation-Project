import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String displayName;
  final String email;

  const UserModel({required this.displayName, required this.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      displayName: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }

  @override
  List<Object?> get props => [displayName, email];
}
