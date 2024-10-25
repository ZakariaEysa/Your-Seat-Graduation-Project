import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  String phoneNumber = '';
  String smsCode = '';
  bool codeSent = false;
//201091058098
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            SizedBox(height: 16),
            codeSent
                ? TextField(
                    decoration: InputDecoration(labelText: "Enter OTP"),
                    onChanged: (value) {
                      smsCode = value;
                    },
                  )
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (codeSent) {
                  // Verify the OTP
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsCode);
                  UserCredential userCredential =
                      await _auth.signInWithCredential(credential);
                  User? user = userCredential.user;
                  print("User signed up: ${user?.phoneNumber}");
                } else {
                  // Send the OTP
                  await _auth.verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      // Auto sign-in
                      UserCredential userCredential =
                          await _auth.signInWithCredential(credential);
                      User? user = userCredential.user;
                      print(
                          "User signed up automatically: ${user?.phoneNumber}");
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print("Verification failed: ${e.message}");
                    },
                    codeSent: (String verId, int? resendToken) {
                      setState(() {
                        codeSent = true;
                        verificationId = verId;
                      });
                    },
                    codeAutoRetrievalTimeout: (String verId) {
                      verificationId = verId;
                    },
                  );
                }
              },
              child: Text(codeSent ? "Verify OTP" : "Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  String phoneNumber = '';
  String smsCode = '';
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            SizedBox(height: 16),
            codeSent
                ? TextField(
                    decoration: InputDecoration(labelText: "Enter OTP"),
                    onChanged: (value) {
                      smsCode = value;
                    },
                  )
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (codeSent) {
                  // Verify the OTP
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsCode);
                  UserCredential userCredential =
                      await _auth.signInWithCredential(credential);
                  User? user = userCredential.user;
                  print("User signed in: ${user?.phoneNumber}");
                } else {
                  // Send the OTP
                  await _auth.verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      // Auto sign-in
                      UserCredential userCredential =
                          await _auth.signInWithCredential(credential);
                      User? user = userCredential.user;
                      print(
                          "User signed in automatically: ${user?.phoneNumber}");
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print("Verification failed: ${e.message}");
                    },
                    codeSent: (String verId, int? resendToken) {
                      setState(() {
                        codeSent = true;
                        verificationId = verId;
                      });
                    },
                    codeAutoRetrievalTimeout: (String verId) {
                      verificationId = verId;
                    },
                  );
                }
              },
              child: Text(codeSent ? "Verify OTP" : "Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
