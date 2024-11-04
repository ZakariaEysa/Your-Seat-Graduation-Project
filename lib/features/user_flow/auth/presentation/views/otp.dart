import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../widgets/confirm_part.dart';

class Otp extends StatelessWidget {
  static const String routeName = "confirm";

  final TextEditingController N1 = TextEditingController();
  final TextEditingController N2 = TextEditingController();
  final TextEditingController N3 = TextEditingController();
  final TextEditingController N4 = TextEditingController();
  final TextEditingController N5 = TextEditingController();
  final TextEditingController N6 = TextEditingController();

  Otp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        title: HeadAppBar(
          title: 'OTP',
          onBackPressed: () {
            Navigator.pop(context);
          },
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
              children: [
                ConfirmPart(title: '', controllers: N1),
                ConfirmPart(title: '', controllers: N2),
                ConfirmPart(title: '', controllers: N3),
                ConfirmPart(title: '', controllers: N4),
                ConfirmPart(title: '', controllers: N5),
                ConfirmPart(title: '', controllers: N6),
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
              navigateTo(context: context, screen: const HomeScreen());
            },
          ),
        ],
      ),
    );
  }
}
