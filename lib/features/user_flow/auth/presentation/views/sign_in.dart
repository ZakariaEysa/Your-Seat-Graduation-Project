import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
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
import 'package:yourseatgraduationproject/utils/validation_utils.dart';
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
                  Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: Text(
                      lang.pleaseFillTheCredentials,
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: TextFormFieldBuilder(
                      height: 80.h,
                      type: TextInputType.phone,
                      label: lang.phonenumber,
                      controller: cubit.phoneController,
                      hinitText: lang.phonenumber,
                      prefixIcon: Icon(Icons.phone),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: TextFormFieldBuilder(
                      type: TextInputType.text,
                      obsecure: obscure2,
                      prefixIcon: const Image(
                          image: AssetImage("assets/images/Password.png")),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() => obscure2 = !obscure2);
                        },
                        child: Icon(
                            obscure2 ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey),
                      ),
                      height: 90.h,
                      controller: cubit.passwordController,
                      label: lang.password,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return lang.enter_password;
                        if (!isValidPassword(value))
                          return lang.password_validation;
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
                          BotToast.showText(text: lang.enter_valid_phone);
                        }
                      },
                      child: Text(
                        lang.forgotPassword,
                        style:
                            theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ButtonBuilder(
                    text: lang.sign_in,
                    ontap: () async {
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
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(color: Colors.white, thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child:
                              Text(lang.or, style: theme.textTheme.titleMedium),
                        ),
                        const Expanded(
                            child: Divider(color: Colors.white, thickness: 1)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: SignInPart(
                      onTap: () {
                        cubit.loginWithFacebook();
                      },
                      title: lang.continue_with_facebook,
                      icon: Icons.facebook,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: SignInPart(
                      onTap: () {
                        cubit.signInWithGoogle();
                      },
                      title: lang.continue_with_google,
                      icon: Icons.g_mobiledata_rounded,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: SignInPart(
                      onTap: () {
                        HiveStorage.set(HiveKeys.role, Role.guest.toString());
                        navigateAndRemoveUntil(
                            context: context, screen: const HomeLayout());
                      },
                      title: lang.continue_as_guest,
                      icon: Icons.account_box_outlined,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lang.no_account,
                          style: theme.textTheme.bodySmall!
                              .copyWith(fontSize: 17)),
                      InkWell(
                        onTap: () {
                          navigateTo(
                            context: context,
                            screen: BlocProvider(
                              create: (context) => AuthCubit(
                                AuthRepoImpl(AuthRemoteDataSourceImpl(
                                    FirebaseAuth.instance, GoogleSignIn())),
                              ),
                              child: const SignUp(),
                            ),
                          );
                        },
                        child: Text(lang.sign_up,
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontSize: 17)),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
