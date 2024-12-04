import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  const InfoContainer({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding:  EdgeInsets.all(15.sp),
      alignment: Alignment.centerLeft,
      width: 270.w,
      height: 49.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        color: theme.colorScheme.onSecondary
      ),
      child: Text(title,textAlign: TextAlign.start,style: theme.textTheme.bodyMedium),
    );
  }
}
