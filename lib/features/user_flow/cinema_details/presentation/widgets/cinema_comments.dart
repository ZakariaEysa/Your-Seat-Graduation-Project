import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CinemaComments extends StatelessWidget {
  final String image;
  final String titlename;
  final String title;
  const CinemaComments(
      {super.key,
      required this.image,
      required this.title,
      required this.titlename});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 65.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF150B34),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 35.w,
            height: 42.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titlename,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                ),
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 10 .sp)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
