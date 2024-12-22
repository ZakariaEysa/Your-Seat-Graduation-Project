import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class Director extends StatelessWidget {
  final String name;
  final String imagePath;

  const Director({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: 140.w,
        height: 58.h,
        margin: EdgeInsets.only(right: 22.w),
        decoration: BoxDecoration(
          color: const Color(0xFF7427BF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 2.w),
            Padding(
              padding: EdgeInsets.only(right: 12.w, left: 11.w),
              child: Text(name,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp)),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
