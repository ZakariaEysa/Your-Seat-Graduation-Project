import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:yourseatgraduationproject/widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    var lang = S.of(context);
    final theme = Theme.of(context);

    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        title: HeadAppBar(title: lang.sign_in),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is GoogleAuthSuccess) {
              HiveStorage.set(HiveKeys.role, Role.gmail.toString());

              BotToast.showText(
                  text: '${lang.login_successful} ${state.user.displayName}');
              navigateAndRemoveUntil(
                  context: context, screen: const HomeLayout());
            } else if (state is FacebookAuthSuccess) {
              HiveStorage.set(HiveKeys.role, Role.facebook.toString());

              BotToast.showText(
                  text: '${lang.login_successful} ${state.user.displayName}');
              navigateAndRemoveUntil(
                  context: context, screen: const HomeLayout());
            } else if (state is UserValidationSuccess) {
              HiveStorage.set(HiveKeys.role, Role.phone.toString());
              BotToast.showText(text: lang.login_successful);
              navigateAndRemoveUntil(
                  context: context, screen: const HomeLayout());
            } else if (state is GoogleAuthError) {
              BotToast.showText(text: state.errorMsg);
            } else if (state is FacebookAuthError) {
              BotToast.showText(text: state.errorMsg);
            } else if (state is UserValidationError) {
              BotToast.showText(text: state.error);
            } else if (state is AuthLoading) {
              BotToast.showLoading();
            }
          },
          builder: (context, state) {
            return Form(
                key: cubit.formKeyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    // النص يأتي من اليمين
                    FadeInRight(
                      delay: const Duration(milliseconds: 200),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, bottom: 15.h),
                        child: Text(
                          lang.pleaseFillTheCredentials,
                          style: theme.textTheme.bodySmall!
                              .copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // الحقول النصية تأتي من اليمين
                    FadeInRight(
                      delay: const Duration(milliseconds: 550),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: TextFormFieldBuilder(
                          height: 80.h,
                          type: TextInputType.phone,
                          label: lang.phonenumber,
                          controller: cubit.phoneController,
                          hinitText: lang.phonenumber,
                          imagePath: "assets/images/telephone.png",
                          obsecure: false,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return lang.enter_phone_number;
                            if (value.length != 11)
                              return lang.invalid_phone_format;
                            return null;
                          },
                        ),
                      ),
                    ),

                    FadeInRight(
                      delay: const Duration(milliseconds: 600),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: TextFormFieldBuilder(
                          height: 80.h,
                          type: TextInputType.text,
                          obsecure: obscure2,
                          imagePath: "assets/images/padlock.png",
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() => obscure2 = !obscure2);
                            },
                            child: Icon(
                                obscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey),
                          ),
                          controller: cubit.passwordController,
                          label: lang.password,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return lang.enter_password;
                            return null;
                          },
                        ),
                      ),
                    ),

                    // النصوص الأخرى تأتي من اليسار
                    FadeInLeft(
                      delay: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: 20.w, bottom: 15.h, top: 12.h),
                        child: GestureDetector(
                          onTap: () {
                            if (cubit.phoneController.text.length == 11) {
                              navigateTo(context: context, screen: const Otp());
                            } else {
                              BotToast.showText(text: lang.enter_valid_phone);
                            }
                          },
                          child: Align(
                            alignment:
                                Alignment.centerRight, // محاذاة النص لليمين
                            child: Text(
                              lang.forgotPassword,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 14.sp,
                                color: const Color(0xFFC1B2B2),
                              ),
                              textAlign: TextAlign.right, // التوجيه لليسار هنا
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    FadeInLeft(
                      delay: const Duration(milliseconds: 750),
                      child: ButtonBuilder(
                        image: "assets/images/SignIn.png",
                        text: "",
                        onTap: () async {
                          if (cubit.formKeyLogin.currentState!.validate()) {
                            cubit.validateUser(cubit.phoneController.text,
                                cubit.passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(lang.fill_all_fields)));
                          }
                        },
                        width: 220.w,
                        height: 55.h,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    FadeInLeft(
                      delay: const Duration(milliseconds: 800),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          children: [
                            const Expanded(
                                child:
                                    Divider(color: Colors.white, thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: Text(lang.or,
                                  style: theme.textTheme.titleMedium),
                            ),
                            const Expanded(
                                child:
                                    Divider(color: Colors.white, thickness: 1)),
                          ],
                        ),
                      ),
                    ),

                    FadeInLeft(
                      delay: const Duration(milliseconds: 850),
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: SignInPart(
                          onTap: () {
                            cubit.loginWithFacebook();
                          },
                          title: lang.continue_with_facebook,
                          imagePath: "assets/images/facebook.png",
                        ),
                      ),
                    ),

                    FadeInLeft(
                      delay: const Duration(milliseconds: 900),
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: SignInPart(
                          onTap: () {
                            cubit.signInWithGoogle();
                          },
                          title: lang.continue_with_google,
                          imagePath: "assets/images/mdi_google.png",
                        ),
                      ),
                    ),

                    FadeInLeft(
                      delay: const Duration(milliseconds: 950),
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: SignInPart(
                          onTap: () {
                            HiveStorage.set(
                                HiveKeys.role, Role.guest.toString());
                            navigateAndRemoveUntil(
                                context: context, screen: const HomeLayout());
                          },
                          title: lang.continue_as_guest,
                          imagePath: "assets/images/Vector.png",
                        ),
                      ),
                    ),

                    // النص النهائي يأتي من اليسار
                    FadeInLeft(
                      delay: const Duration(milliseconds: 1000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lang.no_account,
                            style: theme.textTheme.bodySmall!
                                .copyWith(fontSize: 17.sp),
                          ),
                          SizedBox(width: 5.w),
                          InkWell(
                            onTap: () {
                              navigateTo(
                                context: context,
                                screen: BlocProvider(
                                  create: (context) => AuthCubit(AuthRepoImpl(
                                      AuthRemoteDataSourceImpl(
                                          FirebaseAuth.instance,
                                          GoogleSignIn()))),
                                  child: const SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              lang.sign_up,
                              style: theme.textTheme.labelLarge!
                                  .copyWith(fontSize: 17.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
