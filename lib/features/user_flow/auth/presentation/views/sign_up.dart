import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../widgets/app_bar/appbar.dart';
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
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years =
      List<int>.generate(80, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BuilderAppBar(
                title: 'Sign Up',
              ),
              SizedBox(height: 25.sp),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: FadeInRight(
                  delay: const Duration(milliseconds: 550),
                  child: Text(
                    'Please fill in the credentials',
                    style: theme.textTheme.bodySmall!.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
               SizedBox(
                height: 10.h,
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: userName,
                    type: TextInputType.text,
                    obsecure: false,
                    label: 'Username',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter user name";
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
                  padding:  EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: phone,
                    label: 'Phone Number',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter phone number";
                      }
                      if (value.length != 11) {
                        return 'Wrong phone format';
                      }
                      return null;
                    },
                    obsecure: false,
                    type: TextInputType.phone,
                    imagePath: 'assets/images/Phone.png',
                  ),
                ),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Padding(
                  padding:  EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: password,
                    type: TextInputType.text,
                    label: 'Password',
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Enter Password";
                      }
                      if (text.length < 6) {
                        return "password should be at least 6 characters";
                      }
                      return null;
                    },
                    obsecure: obscure,
                    imagePath: "assets/images/Password.png",
                    suffixIcon: InkWell(
                        onTap: () {
                          if (obscure) {
                            obscure = false;
                          } else {
                            obscure = true;
                          }
                          setState(() {});
                        },
                        child: obscure
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )),
                  ),
                ),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Padding(
                  padding:  EdgeInsets.all(16.0.sp),
                  child: TextFormFieldBuilder(
                    controller: confirmPassword,
                    label: 'Confirm Password',
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Enter confirmation password";
                      }
                      if (text != password.text) {
                        return "Wrong confirmation password";
                      }
                      return null;
                    },
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
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              FadeInRight(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  padding: EdgeInsets.only(left: 13.sp),
                  child: Text(
                    'Birth Date :',
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
                      hintText: 'Month',
                      selectedValue: selectedMonth,
                      itemsList: months,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                    ),
                    BirthDateDropdown<int>(
                      hintText: 'Day',
                      selectedValue: selectedDay,
                      itemsList: days,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedDay = newValue;
                        });
                      },
                    ),
                    BirthDateDropdown<int>(
                      hintText: 'Year',
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
                        if (agree) {
                          agree = false;
                        } else {
                          agree = true;
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
                            ? const Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ),
                     SizedBox(width: 10.w),
                    Text(
                      'I agree with privacy policy',
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: ButtonBuilder(
                  text: 'Sign Up',
                  ontap: () {
                    createAccount();
                  },
                  width: 220.w,
                  height: 55.h,
                ),
              ),
               SizedBox(
                height: 35.h,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        navigateTo(context: context, screen: const SignIn());
                      },
                      child: Text("Already have account?",
                          style: theme.textTheme.bodySmall)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
  }
}
