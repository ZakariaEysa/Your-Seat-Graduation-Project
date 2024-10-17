import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/widgets/sign_in_part.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BuilderAppBar(
                title: 'Sign in',
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'please fill the credentials',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                padding: const EdgeInsets.all(16.0),
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFFC2B2B2)),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonBuilder(
                text: 'Sign in',
                ontap: () {},
                width: 220.w,
                height: 55.h,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SignInPart(
                  title: 'Continue With Facebook ',
                  icon: Icons.facebook,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SignInPart(
                  title: 'Continue With Google ',
                  icon: Icons.g_mobiledata,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SignInPart(
                  title: 'Continue as Guest ',
                  icon: Icons.account_box_outlined,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('Don’t have any account yet?',
                        style:
                            TextStyle(color: Color(0xFFF3E0E0), fontSize: 18)),
                    Text('Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ))
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
