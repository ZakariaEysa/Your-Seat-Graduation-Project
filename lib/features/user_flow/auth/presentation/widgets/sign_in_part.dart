import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPart extends StatelessWidget {
  final String title;
  final IconData icon;
  const SignInPart(
      {super.key, required this.title, required this.icon, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 62.h,
        decoration: BoxDecoration(
            color: Color(0xFF2D1468),
            borderRadius: BorderRadius.circular(40.sp)),
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              Icon(
                icon, // Use the provided icon
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: theme.textTheme.labelLarge!.copyWith(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
