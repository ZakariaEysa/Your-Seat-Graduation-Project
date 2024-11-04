import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_filed.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var cubit = AuthCubit.get(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> loginWithFacebook(BuildContext context) async {
      try {
        final result = await FacebookAuth.instance.login();
        if (result.status == LoginStatus.success) {
          final accessToken = result.accessToken;
          final facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken!.tokenString);
          final userCredential =
              await _auth.signInWithCredential(facebookAuthCredential);
          final userData = await FacebookAuth.instance.getUserData();
          print('User Data: $userData');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'تسجيل الدخول ناجح: ${userCredential.user!.displayName}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فشل تسجيل الدخول: ${result.message}')),
          );
        }
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء تسجيل الدخول')),
        );
      }
    }

    final theme = Theme.of(context);
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Form(
          key: cubit.formKeyLogin,
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
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: TextFormFieldBuilder(
                    height: 80.h,
                    type: TextInputType.phone,
                    label: 'Phone Number',
                    controller: cubit.phoneController,
                    hinitText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    obsecure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length != 11) {
                        return 'Wrong phone format';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: TextFormFieldBuilder(
                    type: TextInputType.text,
                    obsecure: obscure2,
                    prefixIcon: const Image(
                        image: AssetImage("assets/images/Password.png")),
                    suffixIcon: InkWell(
                        onTap: () {
                          if (obscure2) {
                            obscure2 = false;
                          } else {
                            obscure2 = true;
                          }
                          setState(() {});
                        },
                        child: obscure2
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )),
                    suffixImagePath: 'assets/images/hide.png',
                    height: 80.h,
                    controller: cubit.passwordController,
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return "password should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: GestureDetector(
                    onTap: () {
                      if (cubit.phoneController.text.length == 11) {
                        navigateTo(context: context, screen: Otp());
                      } else {
                        BotToast.showText(
                            text: "please enter a valid phone number");
                      }
                    },
                    child: Text(
                      'Forgot password?',
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                ButtonBuilder(
                  text: 'Sign in',
                  ontap: () async {
                    if (cubit.formKeyLogin.currentState!.validate()) {
                      String ss = await checkUserExists(
                          cubit.phoneController.text,
                          cubit.passwordController.text);

                      BotToast.showText(text: ss);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  width: 220.w,
                  height: 55.h,
                ),
                SizedBox(height: 20.h),
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
                  child: SignInPart(
                    onTap: () {
                      loginWithFacebook(context);
                    },
                    title: 'Continue With Facebook ',
                    icon: Icons.facebook,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: SignInPart(
                    onTap: () {
                      cubit.signInWithGoogle();
                    },
                    title: 'Continue With Google ',
                    icon: Icons.g_mobiledata_rounded,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: SignInPart(
                    onTap: () {
                      navigateAndRemoveUntil(
                          context: context, screen: const HomeLayout());
                    },
                    title: 'Continue as Guest ',
                    icon: Icons.account_box_outlined,
                  ),
                ),
                Row(
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
                )
              ]),
        ),
      ),
    );
  }

  Future<String> checkUserExists(String userId, String password) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot userDoc = await usersCollection.doc(userId).get();

      // AppLogs.scussessLog(userDoc.get("password"));
      // AppLogs.scussessLog(userDoc.get("age"));
      if (userDoc.exists) {
        if (userDoc.get("password") == password) {
          return 'logging successful';
        }
        return 'password is wrong ';
      } else {
        return 'phone number doesn\'t exits';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
