import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class Forget extends StatelessWidget {
  const Forget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              navigateTo(context: context, screen:SignIn());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size:25,
            ),
          ),
          backgroundColor: const Color(0xFF2E1371),
          title: Text(
           lang.forgetPassword,
            style: theme.textTheme.labelLarge!.copyWith(fontSize: 28.sp),
          ),
          titleSpacing: 30.0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:50.h),
              child: Image.asset(
                "assets/images/forget.png",
                width: 242.w,
                height: 250.h,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(lang.pleaseEnterYourEmailToReceiveAVerificationCard,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            SizedBox(
              height:50.h,
            ),
            TextFormFieldBuilder(
              width:312.w,
              height:48.h,
              controller: TextEditingController(),
              type: TextInputType.emailAddress,
              obsecure: false,
              label: "Email",
              imagePath: "assets/images/email 2.png",
              color: Color(0xFF1E126E),
            ),
            SizedBox(
              height:60.h,
            ),
            ButtonBuilder(
              width: 191.w,
              height:48.h,
              image: HiveStorage.get(HiveKeys.isArabic)
                  ? "assets/icons/send11_arabic.png"
                  : "assets/icons/send11.png",
              text: '',
              onTap: () {
                navigateTo(context: context, screen:Otp());
              },
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
