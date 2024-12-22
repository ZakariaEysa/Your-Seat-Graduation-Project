import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';

import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../widgets/otp_textfield.dart';
import '../widgets/timer.dart';

class Otp extends StatelessWidget {
  final TextEditingController N1 = TextEditingController();
  final TextEditingController N2 = TextEditingController();
  final TextEditingController N3 = TextEditingController();
  final TextEditingController N4 = TextEditingController();
  final TextEditingController N5 = TextEditingController();
  final TextEditingController N6 = TextEditingController();


  final FocusNode F1 = FocusNode();
  final FocusNode F2 = FocusNode();
  final FocusNode F3 = FocusNode();
  final FocusNode F4 = FocusNode();
  final FocusNode F5 = FocusNode();
  final FocusNode F6 = FocusNode();

  Otp({super.key, this.isSuccessOtp});

  final  Future<void>Function()?  isSuccessOtp ;
  void nextField({
    required String value,
    required FocusNode focusNode,
  }) {
    if (value.isNotEmpty) {
      focusNode.requestFocus();
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    bool isOtpValid = await EmailOTP.verifyOTP(otp: otp);
    if (isOtpValid) {
   if(isSuccessOtp==null) {


        await AuthCubit.get(context).verifyedSendOtp();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeLayout()),
        );

      }else{

       await  isSuccessOtp!();
      }



    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28
        ),
        backgroundColor: const Color(0xFF2E1371),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(33,0 , 0, 15),
          child:  HeadAppBar(
            title: 'Confirm OTP code',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'Please Enter The 6 Digit Code Sent To Your Email ',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpFieldWidget(controller: N1, currentFocus: F1, nextFocus: F2, nextField: nextField),
                OtpFieldWidget(controller: N2, currentFocus: F2, nextFocus: F3, nextField: nextField),
                OtpFieldWidget(controller: N3, currentFocus: F3, nextFocus: F4, nextField: nextField),
                OtpFieldWidget(controller: N4, currentFocus: F4, nextFocus: F5, nextField: nextField),
                OtpFieldWidget(controller: N5, currentFocus: F5, nextFocus: F6, nextField: nextField),
                OtpFieldWidget(controller: N6, currentFocus: F6, nextFocus: null, nextField: nextField),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CountdownTimer(
                  onResend: ()async {
                    String email = AuthCubit.get(context).emailController.text ?? '';
                    if (email.isNotEmpty)  {
                       AuthCubit.get(context).sendOtp(email);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("OTP has been resent"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 5.h),
          ButtonBuilder(
            text: 'Continue',
            onTap: () {
              if (N1.text.isEmpty ||
                  N2.text.isEmpty ||
                  N3.text.isEmpty ||
                  N4.text.isEmpty ||
                  N5.text.isEmpty ||
                  N6.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter all numbers OTP'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                String otp =
                    N1.text + N2.text + N3.text + N4.text + N5.text + N6.text;
                verifyOtp(context, otp);
              }
            },
          ),
        ],
      ),
    );
  }



}
