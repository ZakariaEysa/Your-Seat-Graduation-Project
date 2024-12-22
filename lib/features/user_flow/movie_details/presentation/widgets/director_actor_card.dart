import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/network_image/cached_network_image_f.dart';

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
        height: 58.h,
        margin: EdgeInsets.only(right: 22.w),
        decoration: BoxDecoration(
          color: const Color(0xFF7427BF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding:  EdgeInsetsDirectional.only(start: 5.w),
              child: CachedNetworkImageF(imageUrl: imagePath, fit: BoxFit.fill,isCircle: true,

              width: 50.w,
                height: 50.h,
              ),
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
