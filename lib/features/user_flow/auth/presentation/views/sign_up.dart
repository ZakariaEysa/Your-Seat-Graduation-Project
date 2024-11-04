import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/confirm.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/dialog_utilits.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/utils/validation_utils.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../widgets/BirthDateDropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedMonth;
  int? selectedDay;
  int? selectedYear;
  bool agree = true;
  bool obscure = true;
  bool obscure2 = true;
  bool privacyPolicy = false;
  String verificationId = "";
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();

  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years = List<int>.generate(80, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {

    var local = S.of(context);
    var theme = Theme.of(context);
    final List<String> months = [
      local.january, local.february, local.march, local.april, local.may, local.june,
      local.july ,local.august, local.september, local.october, local.november, local.december
    ];
    return ScaffoldF(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 28,
          color: Colors.white
        ),
        backgroundColor: Color(0xFF2E1371),
        title: Padding(
          padding: const EdgeInsets.only(right: 35.0 , bottom: 12),
          child: HeadAppBar(
            title: "Sign Up",

          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // BuilderAppBar(
              //   title: local.signUp,
              // ),
              SizedBox(height: 25.sp),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
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
                    controller: userName,
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
                    imagePath: 'assets/images/Username.png',
                  ),
                ),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: phone,
                    label: local.phonenumber,
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
                    height: 100.h,
                    controller: password,
                    type: TextInputType.text,
                    label: local.password,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return local.enterPassword;
                      }
                      if (!isValidPassword(text)) {
                        return local.passwordCriteria;
                      }
                      return null;
                    },
                    obsecure: obscure,
                    imagePath: "assets/images/Password.png",
                    suffixIcon: InkWell(
                        onTap: () {
                          obscure = !obscure;
                          setState(() {});
                        },
                        child: obscure
                            ? const Icon(Icons.visibility_off, color: Colors.grey)
                            : const Icon(Icons.visibility, color: Colors.grey)),
                  ),
                ),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: confirmPassword,
                    label: local.confirmPassword,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return local.enterConfirmPassword;
                      }
                      if (text != password.text) {
                        return local.wrongConfirmPassword;
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    obsecure: obscure2,
                    prefixIcon: const Image(image: AssetImage("assets/images/Password.png")),
                    suffixIcon: InkWell(
                        onTap: () {
                          obscure2 = !obscure2;
                          setState(() {});
                        },
                        child: obscure2
                            ? const Icon(Icons.visibility_off, color: Colors.grey)
                            : const Icon(Icons.visibility, color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  padding: EdgeInsets.only(left: 13.sp),
                  child: Text(
                    local.birthDate,
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              FadeInLeft(
                delay: const Duration(milliseconds: 550),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BirthDateDropdown<String>(
                      hintText: local.month,
                      selectedValue: selectedMonth,
                      itemsList: months,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                    ),
                    BirthDateDropdown<int>(
                      hintText: local.day,
                      selectedValue: selectedDay,
                      itemsList: days,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedDay = newValue;
                        });
                      },
                    ),
                    BirthDateDropdown<int>(
                      hintText: local.year,
                      selectedValue: selectedYear,
                      itemsList: years,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Row(
                  children: [
                    SizedBox(width: 75.w),
                    InkWell(
                      onTap: () {
                        agree = !agree;
                        privacyPolicy = !agree;
                        setState(() {});
                      },
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: agree
                            ? BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.w))
                            : const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: agree
                            ? const Icon(Icons.check, size: 20, color: Colors.white)
                            : const Icon(Icons.check, size: 20, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      local.iAgreeWithPrivacyPolicy,
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Text(
                  privacyPolicy ? "" : local.iAgreeWithPrivacyPolicy,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: ButtonBuilder(
                  text: local.signUp,
                  ontap: () async {
                    if (formKey.currentState?.validate() == true) {
                      try {
                        await FirebaseFirestore.instance.collection('users')
                            .doc(phone.text)
                            .set({
                          'username': userName.text,
                          'phone': phone.text,
                          'password': password.text,
                          'birth_date': {
                            'day': selectedDay,
                            'month': selectedMonth,
                            'year': selectedYear,
                          },
                        });
                        log(local.registerSuccess);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(local.ok),
                              content: Text(local.registerSuccess),
                            );
                          },
                        );
                      } catch (e) {
                        log(local.errorSavingUser);
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignIn()));
                },
                child: Text(local.alreadyHaveAccount,
                    style: theme.textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
