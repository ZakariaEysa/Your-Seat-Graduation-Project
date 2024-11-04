import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_filed.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var cubit = AuthCubit.get(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> loginWithFacebook(BuildContext context) async {
      try {
        // 1. تسجيل الدخول باستخدام Facebook Auth
        final result = await FacebookAuth.instance.login();

        if (result.status == LoginStatus.success) {
          // 2. الحصول على توكن الوصول Access Token من فيسبوك
          final accessToken = result.accessToken;

          // 3. إنشاء بيانات اعتماد الدخول Firebase
          final facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken!.tokenString);

          // 4. تسجيل الدخول باستخدام Firebase
          final userCredential =
              await _auth.signInWithCredential(facebookAuthCredential);

          // 5. الحصول على بيانات المستخدم
          final userData = await FacebookAuth.instance.getUserData();
          print('User Data: $userData');

          // 6. التأكد من نجاح عملية التسجيل
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
        // التعامل مع الأخطاء وعرض رسالة
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء تسجيل الدخول')),
        );
      }
    }

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
                child:  TextFiled(
                  controller: AuthCubit.get(context).phoneController,

                  hintText: 'Phone Number',
                  icon: Icons.phone,
                  isPassword: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child:  TextFiled(
                  hintText: 'password',
                  icon: Icons.key,
                  isPassword: true,
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
                ontap: () async {



                  String ss= await checkUserExists("+20123456789");

                  AppLogs.scussessLog(ss);

                  // PhoneAuthService().loginWithPhoneNumber(context,
                  //     cubit.emailController.text); // Example phone number

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
                    AuthCubit.get(context).signInWithGoogle();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have any account yet?',
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 17)),
                  InkWell(
                    onTap: () {
                      // navigateTo(context: context, screen: const SignUp());

                    },
                    child: Text('  Sign Up',
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 17)),
                  )
                ],
              )
            ]),
      ),
    );
  }
  Future<String> checkUserExists(String userId) async {

    try {
      // الوصول إلى مجموعة المستخدمين
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

      // البحث عن المستخدم باستخدام الرقم المرسل
      DocumentSnapshot userDoc = await usersCollection.doc(userId).get();

      AppLogs.scussessLog(
          userDoc.get("password")  );


      AppLogs.scussessLog(
          userDoc.get("age")  );
      if (userDoc.exists) {
        // إذا وجد المستخدم
        return 'User found';
      } else {
        // إذا لم يوجد المستخدم
        return 'User not found';
      }
    } catch (e) {
      // في حالة حدوث خطأ
      return 'Error: $e';
    }
  }

}
