import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/dialog_utilits.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/utils/validation_utils.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../../data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import '../../domain/repos_impl/auth_repo_impl.dart';
import '../widgets/BirthDateDropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agree = true;
  bool obscure = true;
  bool obscure2 = true;
  bool privacyPolicy = false;
  String verificationId = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years =
  List<int>.generate(80, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    var local = S.of(context);
    var theme = Theme.of(context);
    final List<String> months = [
      local.january,
      local.february,
      local.march,
      local.april,
      local.may,
      local.june,
      local.july,
      local.august,
      local.september,
      local.october,
      local.november,
      local.december
    ];

    return ScaffoldF(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 28, color: Colors.white),
        backgroundColor: theme.primaryColor,
        title: HeadAppBar(
          title: local.signUp,
        ),
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Form(
              key: cubit.formKeyRegister,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 550),
                      child: Text(
                        local.pleaseFillTheCredentials,
                        style: theme.textTheme.bodySmall!.copyWith(fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: TextFormFieldBuilder(
                        height: 80.h,
                        controller: cubit.userName,
                        type: TextInputType.text,
                        obsecure: false,
                        label: local.username,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return local.enterUsername;
                          }
                          if (!nameRegex.hasMatch(value)) {
                            return local.invalidUsername;
                          }
                          return null;
                        },
                        imagePath: 'assets/images/user.png',
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: TextFormFieldBuilder(
                        height: 80.h,
                        controller: cubit.phone,
                        label: local.email,
                        validator: (value) {
                          String? enteredNumber = value;
                          if (value == null || value.trim().isEmpty) {
                            return local.enterPhoneNumber;
                          }
                          if (value.length == 10 &&
                              value.startsWith("1") &&
                              egyptianPhoneRegex.hasMatch(value)) {
                            value = "0${enteredNumber!}";
                          } else {
                            return local.wrongPhoneFormat;
                          }
                          return null;
                        },
                        obsecure: false,
                        type: TextInputType.phone,
                        imagePath: 'assets/images/+20.png',
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: TextFormFieldBuilder(
                        height: 80.h,
                        controller: cubit.password,
                        type: TextInputType.text,
                        label: local.password,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return local.enterPassword;
                          }
                          if (!isValidPassword(text)) {
                            return local.password_validation;
                          }
                          return null;
                        },
                        obsecure: obscure,
                        imagePath: "assets/images/padlock.png",
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: Icon(
                              obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: TextFormFieldBuilder(
                        height: 80.h,
                        controller: cubit.confirmPassword,
                        label: local.confirmPassword,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return local.enterConfirmPassword;
                          }
                          if (text != cubit.password.text) {
                            return local.wrongConfirmPassword;
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        obsecure: obscure2,
                        imagePath: "assets/images/access.png",
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obscure2 = !obscure2;
                              });
                            },
                            child: Icon(
                              obscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Container(
                      padding: EdgeInsets.only(left: 13.w),
                      child: Text(
                        local.birthDate,
                        style:
                        theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 550),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BirthDateDropdown<String>(
                            hintText: local.month,
                            selectedValue: cubit.selectedMonth,
                            itemsList: months,
                            onChanged: (String? newValue) {
                              setState(() {
                                cubit.selectedMonth = newValue;
                              });
                            },
                          ),
                          BirthDateDropdown<int>(
                            hintText: local.day,
                            selectedValue: cubit.selectedDay,
                            itemsList: days,
                            onChanged: (int? newValue) {
                              setState(() {
                                cubit.selectedDay = newValue;
                              });
                            },
                          ),
                          BirthDateDropdown<int>(
                            hintText: local.year,
                            selectedValue: cubit.selectedYear,
                            itemsList: years,
                            onChanged: (int? newValue) {
                              setState(() {
                                cubit.selectedYear = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),
                  FadeInRight(
                    delay: const Duration(milliseconds: 550),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 40.w),
                        InkWell(
                          onTap: () {
                            if (agree) {
                              agree = false;
                              privacyPolicy = true;
                            } else {
                              agree = true;
                              privacyPolicy = false;
                            }
                            setState(() {});
                          },
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: agree
                                ? BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.white, width: 2.w))
                                : const BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: agree
                                ?  Icon(
                              Icons.check,
                              size: 20.sp,
                              color: Colors.white,
                            )
                                :  Icon(
                              Icons.check,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: (){
                            navigateTo(context: context, screen: const AboutUs());
                          },
                          child: FlickerNeonText(
                            text: local.iAgreeWithPrivacyPolicy,
                            flickerTimeInMilliSeconds: 600,
                            spreadColor: Colors.white,
                            blurRadius: 20.r,
                            textSize: 18.sp,
                            // style:
                            //     theme.textTheme.bodySmall!.copyWith(fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 550),
                    child: Text(
                      privacyPolicy ? "" : local.pleaseAcceptPrivacyAndPolicy,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  FadeInUp(
                    delay: const Duration(milliseconds: 550),
                    child: ButtonBuilder(
                      image: "assets/images/Sign up.png",
                      text: "",
                      onTap: () {
                        setState(() {
                          if (agree == true) {
                            privacyPolicy = false;
                          } else if (agree == false) {
                            privacyPolicy = true;
                          }
                        });
                        //cubit.registerUser(username: cubit.userName.text, phone: cubit.phone.text, password: cubit.password.text, birthDate: "${cubit.selectedDay}/${cubit.selectedMonth}/${cubit.selectedYear}");
                        createAccount();
                      },
                      width: 220.w,
                      height: 55.h,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 550),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            navigateAndReplace(
                              context: context,
                              screen: BlocProvider(
                                create: (context) => AuthCubit(AuthRepoImpl(
                                    AuthRemoteDataSourceImpl(
                                        FirebaseAuth.instance, GoogleSignIn()))),
                                child: const SignIn(),
                              ),
                            );
                          },
                          child: Text(local.alreadyHaveAccount,
                              style: theme.textTheme.bodySmall)),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),

                ],
              ),
            ),

          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                BotToast.showText(
                    text:
              state.errorMessage );
              }
              if (state is AuthSuccess) {
                HiveStorage.set(HiveKeys.role, Role.phone.toString());

                navigateAndRemoveUntil(context: context, screen: Otp());
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const AbsorbPointer(
                  absorbing: true,
                  child: LoadingIndicator(),
                );
              }
              return const SizedBox.shrink();
            },
          ),

        ]
      ),
    );
  }
  void createAccount() async {
    AuthCubit auth = AuthCubit.get(context);
    if (auth.formKeyRegister.currentState!.validate() == false) {
      return;
    }
    if (auth.selectedMonth == null ||
        auth.selectedDay == null ||
        auth.selectedYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select your full birth date"),
          duration: Duration(seconds: 2),
        ),
      );
      if (agree == false) {
        setState(() {
          privacyPolicy = false;
        });
        return;
      }
      return;
    }
    if (privacyPolicy == false) {
      return;
    } else {
      auth.registerUser(username: auth.userName.text, phone: auth.phone.text, password: auth.password.text, birthDate: "${auth.selectedDay}/${auth.selectedMonth}/${auth.selectedYear}");
      //await checkUserExists(auth.phone.text);
    }
  }

  Future<void> checkUserExists(String userId) async {
    try {
      AppLogs.errorLog(userId.toString());
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentSnapshot userDoc = await usersCollection
          .doc(
        "0$userId",
      )
          .get();

      if (userDoc.exists) {
        AppLogs.errorLog("aaa");

        DialogUtils.showMessage(context, 'Sorry this account exist before',
            posAction: () {
              // navigatePop(context: context);
            }, posActionTitle: "Ok");

        return;
      }

      await saveUserToFireStore();
      DialogUtils.showMessage(context, "Registered Successfully",
          posActionTitle: "Ok", posAction: () {
            navigateTo(context: context, screen:  Otp());
          });

      AppLogs.errorLog("ww");
    } catch (e) {}
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      // Start the phone number verification process
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-complete verification if the device is already verified
          signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification errors
          print('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store the verification ID and resend token
          // Prompt the user to enter the verification code
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout if the user doesn't enter the code
        },
      );
    } catch (e) {
      print('Error during phone number verification: ${e.toString()}');
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      // Sign in with the verification credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      // User is now signed in
    } catch (e) {
      print('Error signing in with credential: ${e.toString()}');
    }
  }

  Future<void> saveUserToFireStore() async {
    AuthCubit auth = AuthCubit.get(context);
    DialogUtils.showMessage(context, "Creating Account");
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc("0${auth.phone.text}")
          .set({
        'username': auth.userName.text,
        'phone': "0${auth.phone.text}",
        'password': auth.password.text,
        'birthdate':
        "${auth.selectedDay ?? ''}/${auth.selectedMonth ?? ''}/${auth.selectedYear ?? ''}"
      });
      DialogUtils.hideLoading(context);

      print("User saved successfully!");
    } catch (e) {
      print("Error saving user: $e");
    }
  }
}

