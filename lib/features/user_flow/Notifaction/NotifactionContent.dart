import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifactionContent extends StatelessWidget {
  final String imagePath;
  final String title='SALE IS LIVE';
  final String body;
  final String time;
  final String? numOfNotifaction;

  NotifactionContent({
    required this.imagePath,
    //this.title = 'SALE IS LIVE',
    required this.body ,
    required this.time,
    this.numOfNotifaction,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w,right:20.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  if (numOfNotifaction != null)
                    Positioned(
                      top: 0,
                      right: 0,
                        child: Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7443A),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              numOfNotifaction!,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ),
                ],
              ),
              SizedBox(width: 22.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: theme.textTheme.labelLarge?.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      body!,
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 14.sp,
                  color: Color(0xFF6C6C6C),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
