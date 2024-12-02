import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/widgets/social_items.dart';
import 'package:yourseatgraduationproject/resources/constants.dart';

class RowOfSocialItems extends StatelessWidget {
  const RowOfSocialItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialItem(
          url: "assets/images/${AppConstVariables.facebookImg}",
        ),
        SizedBox(width: 22.w), // استخدام ScreenUtil لضبط التباعد
        SocialItem(
          url: "assets/images/${AppConstVariables.emailImg}",
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        SizedBox(width: 22.w), // استخدام ScreenUtil لضبط التباعد
        SocialItem(
          url: "assets/images/${AppConstVariables.linkedInImg}",
        ),
      ],
    );
  }
}
