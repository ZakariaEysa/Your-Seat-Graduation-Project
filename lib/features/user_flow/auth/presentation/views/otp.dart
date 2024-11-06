import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../home/presentation/views/home_screen.dart';

class Otp extends StatelessWidget {
  static const String routeName = "confirm";

  // Controllers for each OTP field
  final TextEditingController N1 = TextEditingController();
  final TextEditingController N2 = TextEditingController();
  final TextEditingController N3 = TextEditingController();
  final TextEditingController N4 = TextEditingController();
  final TextEditingController N5 = TextEditingController();
  final TextEditingController N6 = TextEditingController();

  Otp({super.key});

  void nextField({
    required String value,
    required FocusNode focusNode,
  }) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        title: HeadAppBar(
          title: 'OTP',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'You just need to enter the OTP\nsent to the registered phone\nnumber',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOtpField(N1),
                buildOtpField(N2),
                buildOtpField(N3),
                buildOtpField(N4),
                buildOtpField(N5),
                buildOtpField(N6),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 320.w),
            child: Text(
              '00:59',
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(height: 5.h),
          ButtonBuilder(
            text: 'Continue',
            ontap: () {

              if (N1.text.isEmpty || N2.text.isEmpty || N3.text.isEmpty ||
                  N4.text.isEmpty || N5.text.isEmpty || N6.text.isEmpty) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter all numbers OTP'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {

                navigateTo(context: context, screen: HomeLayout());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildOtpField(TextEditingController controller) {
    return SizedBox(
      width: 40.w,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          counterText: "",
        ),
      ),
    );
  }
}
