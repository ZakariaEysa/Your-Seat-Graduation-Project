import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'google_user_model.g.dart'; // Required for Hive adapter generation

@HiveType(typeId: 1) // Ensure the typeId is unique in your app
class GoogleUserModel extends Equatable {
  @HiveField(0)
  final String displayName;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? password; // Optional, not directly tied to Firebase

  @HiveField(3)
  final String? dateOfBirth; // Optional, custom field

  @HiveField(4)
  final String? image; // Optional, sourced from photoURL in Firebase

  const GoogleUserModel({
    required this.displayName,
    required this.email,
    this.password,
    this.dateOfBirth,
    this.image,
  });

  // Factory constructor to create a GoogleUserModel from a Firebase User object
  factory GoogleUserModel.fromFirebaseUser(User user) {
    return GoogleUserModel(
      displayName: user.displayName ?? 'Unknown',
      email: user.email ?? 'Unknown',
      password: null, // Firebase doesn't expose passwords
      dateOfBirth: null, // To be set manually if required
      image: user.photoURL ?? '', // Firebase's photoURL property
    );
  }

  @override
  List<Object?> get props => [displayName, email, password, dateOfBirth, image];
}
