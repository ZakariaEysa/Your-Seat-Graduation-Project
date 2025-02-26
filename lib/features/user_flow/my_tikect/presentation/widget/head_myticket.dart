import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/network_image/image_replacer.dart';

class HeadMyticket extends StatelessWidget {
  String? imageUrl;
  String? movieName;
  String? movieDuration;
  String? movieCategory;
  String? seatCategory;
  String? movieTime;
  String? movieDate;
  List<String>? seats;
  String? hall;



   HeadMyticket({
  required this.imageUrl,
  required this.movieName,
  required this.movieDuration,
  required this.movieCategory,
  required this.seatCategory,
  required this.movieTime,
  required this.movieDate,
  required this.seats,
  required this.hall
  ,super.key});

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: ImageReplacer(
                    imageUrl:
                    imageUrl??"",
                    width: 100.w, // تقليل العرض ليناسب iPhone
                    height: 160.h,
                  ),
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
                        seatCategory??"",
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
                        movieName??"",
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
                            movieDuration??"",
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
                            movieCategory??"",
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
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع العناصر بالتساوي
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieTime??"",
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                      Text(
                        movieDate??"",
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
                    width: 40.w,
                    height: 40.h,
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seats ${seats??""}",
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                      Text(
                        "Section ${hall??''}",
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
