import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'google_user_model.g.dart'; // Required for Hive adapter generation

@HiveType(typeId: 1) // Ensure the typeId is unique in your app
class GoogleUserModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? password; // Optional, not directly tied to Firebase

  @HiveField(3)
  final String? dateOfBirth; // Optional, custom field

  @HiveField(4)
  final String? image; // Optional, sourced from photoURL in Firebase
  @HiveField(5)

  final String? gender; // Optional, sourced from photoURL in Firebase
  @HiveField(6)

  final String? location; // Optional, sourced from photoURL in Firebase


  const GoogleUserModel({
    required this.name,
    required this.email,
    this.password,
    this.dateOfBirth,
    this.image,
    this.gender,
    this.location,
  });

  // Factory constructor to create a GoogleUserModel from a Firebase User object
  factory GoogleUserModel.fromFirebaseUser(User user) {
    return GoogleUserModel(
      name: user.displayName ?? 'Unknown',
      email: user.email ?? 'Unknown',
      password: null, // Firebase doesn't expose passwords
      dateOfBirth: null, // To be set manually if required
      image: user.photoURL ?? '', // Firebase's photoURL property
      gender: null, // To be set manually if required
      location: null, // To be set manually if required
    );
  }

  @override
  List<Object?> get props => [name, email, password, dateOfBirth, image,gender,location];
}
