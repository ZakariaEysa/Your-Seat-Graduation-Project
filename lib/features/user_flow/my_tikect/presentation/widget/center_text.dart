import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 370.h),
      child: SingleChildScrollView( // Wrap content in a scroll view
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w),
                      child: Image.asset(
                        "assets/icons/money.png",
                        width: 30.w,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '210.000 VND',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w),
                      child: Image.asset(
                        "assets/icons/location.png",
                        width: 30.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Vincom Ocean Park',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        overflow: TextOverflow.ellipsis,  // Add ellipsis when text overflows
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Image.asset(
                      "assets/icons/img_2.png",
                      width: 30.w,
                      height: 20.h,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 60.w),
                  child: Text(
                    '4th floor, Vincom Ocean Park, Da Ton, Gia\n Lam, Ha Noi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                      overflow: TextOverflow.ellipsis,  // Add ellipsis when text overflows
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 25.w, bottom: 18.h),
                      child: Image.asset(
                        "assets/icons/img_3.png",
                        width: 25.w,
                        height: 25.h,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Show this QR code to the ticket counter\n to receive your ticket',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                        overflow: TextOverflow.ellipsis,  // Add ellipsis when text overflows
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
