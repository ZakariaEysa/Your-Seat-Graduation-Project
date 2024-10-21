import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../home/presentation/views/home_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(left:30.h),
                child: Text(
                  'Please fill the credentials',
                  style:theme.textTheme.bodySmall!.copyWith(fontSize:16),
                ),
              ),
             SizedBox(
                height: 15.h,
              ),
              Padding(
                padding:EdgeInsets.all(16.0.sp),
                child: TextFormFieldBuilder(
                  controller: TextEditingController(),
                  type: TextInputType.phone,
                  label: 'Phone Number',
                  obsecure:false,
                  hinitText: 'Phone Number',
                  imagePath: 'assets/images/telephone 1 (1).png',

                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: TextFormFieldBuilder(
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  label: 'Password',
                  obsecure: true
                  ,
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
                  navigateTo(context: context, screen: const HomeScreen());
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
                      padding: EdgeInsets.symmetric(horizontal:8.h),
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
                  title: 'Continue With Facebook ',
                  icon: Icons.facebook ,
                ),
              ),
              Padding(
                padding:EdgeInsets.all(16.0.sp),
                child: SignInPart(
                  title: 'Continue With Google ',
                 icon:Icons.g_mobiledata_rounded ,

                ),
              ),
              Padding(
                padding:  EdgeInsets.all(16.0.sp),
                child: SignInPart(
                  title: 'Continue as Guest ',
                  icon: Icons.account_box_outlined,
                ),
              ),
             const SizedBox(height: 15,),
             Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have any account yet?',
                        style: theme.textTheme.bodySmall!.copyWith(fontSize: 17)),
                    InkWell(
                      onTap: (){
                        navigateTo(context: context, screen: const SignUp());
                      },
                      child: Text('Sign Up',
                          style: theme.textTheme.labelLarge!.copyWith(fontSize: 17)),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}