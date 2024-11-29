import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/model/google_user_model.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../../../../data/hive_stroage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
  Future<String> checkUserExists(String userId, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl(this._auth, this._googleSignIn);

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('User canceled the sign-in process');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      AppLogs.infoLog(userCredential.toString());
      AppLogs.infoLog(userCredential.additionalUserInfo.toString());
      final user = userCredential.user;

      if (user != null) {
        if (HiveStorage.get(HiveKeys.role) == null) {
          HiveStorage.set(
            HiveKeys.role,
            Role.gmail.toString(),
          );
        }

        return UserModel.fromFirebaseUser(user);
      } else {
        throw Exception('Google sign-in failed');
      }
    } catch (e) {
      throw Exception('Error during Google sign-in: $e');
    }
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final userCredential = await _auth.signInWithCredential(credential);
      return UserModel.fromFirebaseUser(userCredential.user!);
    } else {
      throw Exception('Facebook login failed');
    }
  }

  @override
  Future<String> checkUserExists(String userId, String password) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      if (userDoc.get("password") == password) {
        return "LoginSuccessful";
      }
      }

      return "User does not exist or password is incorrect";


    // throw Exception('User does not exist or password is incorrect');
  }
}
