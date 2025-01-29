import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadMyticket extends StatelessWidget {
  const HeadMyticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 40.w, top: 60.h),
              child: Image.asset(
                "assets/images/tik_film.png",
                width: 110.w,
                height: 180.h,
              ),
            ),
               Padding(
                 padding:  EdgeInsetsDirectional.only( top: 40.h, start: 10.w),
                 child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsetsDirectional.only(bottom: 30.h  , start: 140.w),
                      child: Text("Vip" ,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA79F06),

                        ),),
                    ),
                    Text(
                      "Avengers: Infinity War",
                      style: TextStyle(color: Colors.black, fontSize: 16.sp , fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/clock_icon.png",
                          width: 18.w,
                          height: 20.h,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "2 hours 29 minutes",
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Image.asset(
                          "assets/icons/video.png",
                          width: 18.w,
                          height: 20.h,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "on, adventure, sci-fi",
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                               ),
               ),
          ],
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            SizedBox(width: 40.w),
            Row(
              children: [
                Image.asset(
                  'assets/icons/calendar.png',
                  width: 60.w,
                  height: 60.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "14h15’",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    Text(
                      "10.12.2022",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 40.w),
            Row(
              children: [
                Image.asset(
                  'assets/icons/vYzyIu_2_.png',
                  width: 60.w,
                  height: 60.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "seat F10",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    Text(
                      "Section 4",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
