import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPart extends StatelessWidget {
  final String title;
  // final IconData icon;
  const SignInPart(
      {super.key, required this.title, this.onTap, this.imagePath});
  final void Function()? onTap;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 333.w,
        height: 57.h,
        decoration: BoxDecoration(
            color: const Color(0xFF2D1468),
            borderRadius: BorderRadius.circular(40.sp)),
        child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Row(
            children: [
              // Icon(
              //   icon, // Use the provided icon
              //   color: Colors.white,
              //   size:35,
              // ),

              Image.asset(
                imagePath!,
                width: 35.w,
                height: 35.h,
                // fit: BoxFit.cover,
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
