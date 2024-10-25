import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignInService googleSignInService = GoogleSignInService();

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    final theme = Theme.of(context);
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BuilderAppBar(
                title: 'Sign in',
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  'Please fill the credentials',
                  style: theme.textTheme.bodySmall!.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: TextFormFieldBuilder(
                  controller: cubit.emailController,
                  type: TextInputType.phone,
                  label: 'Phone Number',
                  obsecure: false,
                  hinitText: 'Phone Number',
                  imagePath: 'assets/images/telephone 1 (1).png',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: TextFormFieldBuilder(
                  controller: cubit.passwordController,
                  type: TextInputType.text,
                  label: 'Password',
                  obsecure: true,
                  imagePath: 'assets/images/Vector (2).png',
                  suffixImagePath: 'assets/images/hide 1.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Text(
                  'Forgot password?',
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ButtonBuilder(
                text: 'Sign in',
                ontap: () {
                  PhoneAuthService().loginWithPhoneNumber(context,
                      cubit.emailController.text); // Example phone number

                  // loginWithEmailPassword(cubit.emailController.text,
                  //       cubit.passwordController.text);
                  //   register(emailController.text, passwordController.text);

                  //    navigateTo(context: context, screen: const HomeScreen());
                },
                width: 220.w,
                height: 55.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Text(
                        'or',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: const SignInPart(
                  title: 'Continue With Facebook ',
                  icon: Icons.facebook,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: SignInPart(
                  onTap: () {
                    loginWithGoogle();
                  },
                  title: 'Continue With Google ',
                  icon: Icons.g_mobiledata_rounded,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: const SignInPart(
                  title: 'Continue as Guest ',
                  icon: Icons.account_box_outlined,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have any account yet?',
                        style:
                            theme.textTheme.bodySmall!.copyWith(fontSize: 17)),
                    InkWell(
                      onTap: () {
                        navigateTo(context: context, screen: const SignUp());
                      },
                      child: Text('  Sign Up',
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 17)),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }

  void loginWithGoogle() async {
    User? user = await googleSignInService.signInWithGoogle();
    if (user != null) {
      print('User signed in: ${user.displayName}');
    } else {
      print('Google sign-in failed');
    }
  }

  // zakariaeysa@gmail.com
  //123456
}

class GoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain the auth details from the Google user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the Google auth tokens
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Return the signed-in Firebase user
      return userCredential.user;
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

class PhoneAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // This function triggers the OTP SMS for the phone number provided
  Future<void> loginWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    // Show a loading indicator while waiting for verification
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // Phone number needs to be in the full international format, i.e., '+20XXXXXXXXXX'
    String formattedPhoneNumber = '+20' + phoneNumber;

    // Verify phone number by sending an OTP
    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve the SMS code or auto-verify (on certain devices)
        await _auth.signInWithCredential(credential);
        Navigator.of(context).pop(); // Close the loading indicator
        // Handle successful login
        print('Phone number automatically verified and user logged in.');
      },
      verificationFailed: (FirebaseAuthException e) {
        Navigator.of(context).pop(); // Close the loading indicator
        print('Phone number verification failed: ${e.message}');
        // Handle error (e.g., display an error message)
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Verification failed')));
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).pop(); // Close the loading indicator
        // Ask the user to enter the OTP manually
        _showOTPDialog(context, verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout when the auto-retrieval of the OTP fails
        print('Timeout for automatic OTP retrieval.');
      },
    );
  }

  // This function handles the OTP input by the user
  void _showOTPDialog(BuildContext context, String verificationId) {
    String smsCode = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter OTP'),
        content: TextField(
          onChanged: (value) {
            smsCode = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Close the dialog
              Navigator.of(context).pop();

              // Create the PhoneAuthCredential using the verification ID and the SMS code
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: smsCode,
              );

              try {
                // Sign in with the credential (OTP)
                await _auth.signInWithCredential(credential);
                // Handle successful login
                print('User signed in successfully.');
              } catch (e) {
                // Handle error (e.g., incorrect OTP)
                print('Failed to sign in: $e');
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Incorrect OTP')));
              }
            },
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }
}
