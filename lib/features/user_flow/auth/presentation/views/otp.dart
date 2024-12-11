import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../features/user_flow/auth/presentation/views/timer.dart';

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

  Otp({super.key});

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
  await AuthCubit.get(context).verifyedSendOtp();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeLayout()),
      );

    } else {
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
        backgroundColor: const Color(0xFF2E1371),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(85, 0, 0, 0),
          child: const HeadAppBar(
            title: 'OTP',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'You just need to enter the OTP\nsent to the registered Email',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOtpField(N1, F1, F2),
                buildOtpField(N2, F2, F3),
                buildOtpField(N3, F3, F4),
                buildOtpField(N4, F4, F5),
                buildOtpField(N5, F5, F6),
                buildOtpField(N6, F6, null),
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
                  startSeconds: 59,
                  onResend: () {},
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

  Widget buildOtpField(
      TextEditingController controller,
      FocusNode currentFocus,
      FocusNode? nextFocus,
      ) {
    return SizedBox(
      width: 40.w,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          nextField(value: value, focusNode: nextFocus ?? FocusNode());
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2E1371),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color: Color(0x66000000), width:1.5 ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff3C163CFF), width: 1.5),
          ),
          counterText: "",
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
