import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CinemaCard extends StatelessWidget {
  final String title;
  // final String smalltitle;
  // final String largetitle;
  final String imageUrl;

  const CinemaCard(
      {super.key,
      required this.title,
      // required this.smalltitle,
      // required this.largetitle,
      required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 350.w,
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF25123A),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                ),
                const Spacer(),
                Image.asset(
                  imageUrl,
                  width: 35.w,
                  height: 20.h,
                )
              ],
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     // Text(smalltitle,
            //     //     style: theme.textTheme.bodyMedium!.copyWith(
            //     //         fontSize: 12.sp, color: const Color(0xFFF2F2F2))),
            //     // SizedBox(
            //     //   width: 5.w,
            //     // ),
            //     // Image.asset(
            //     //   "assets/images/Line 20.png",
            //     //   height: 10.h,
            //     //   width: 10.w,
            //     //   color: Colors.white,
            //     // ),
            //     // SizedBox(
            //     //   width: 5.w,
            //     // ),
            //     // Text(largetitle,
            //     //     style: theme.textTheme.bodyMedium!.copyWith(
            //     //         fontSize: 11.sp, color: const Color(0xFFF2F2F2)))
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
