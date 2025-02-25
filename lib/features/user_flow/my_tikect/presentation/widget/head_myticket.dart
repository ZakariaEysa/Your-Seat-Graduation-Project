import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadMyticket extends StatelessWidget {
  const HeadMyticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w), // لضبط التباعد الجانبي
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h , left: 20.w),
                child: Image.asset(
                  "assets/images/Rectangle 22.png",
                  width: 100.w, // تقليل العرض ليناسب iPhone
                  height: 160.h,
                ),
              ),
              SizedBox(width: 10.w), // تباعد مناسب
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end
                  ,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right:  18.0 ,top:10 ),
                      child: Text(
                        "Vip",
                        style: TextStyle(
                          fontSize: 22.sp, // تقليل الحجم ليناسب الشاشات الصغيرة
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA79F06),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Avengers: Infinity War",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/clock_icon.png",
                          width: 16.w,
                          height: 18.h,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            "2 hours 29 minutes",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/video.png",
                          width: 16.w,
                          height: 18.h,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            "Action, Adventure, Sci-Fi",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع العناصر بالتساوي
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: 70.w,
                    height: 70.h,
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  Image.asset(
                    'assets/icons/vYzyIu_2_.png',
                    width: 70.w,
                    height: 70.h,
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seat F10",
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
      ),
    );
  }
}
