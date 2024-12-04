import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;
  final String time;
  final String? numOfNotification;

  const NotificationContent({
    super.key,
    required this.imagePath,
    this.title = 'SALE IS LIVE', // قيمة افتراضية
    required this.body,
    required this.time,
    this.numOfNotification,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w), // حواف أفقية باستخدام ScreenUtil
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // صورة الإشعار
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
                  // عدد الإشعارات
                  if (numOfNotification != null)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD7443A),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            numOfNotification!,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 22.w), // مسافة أفقية
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان الإشعار
                    Text(
                      title,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h), // مسافة عمودية
                    // وصف الإشعار
                    Text(
                      body,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,
                        color: Colors.grey.shade700,
                      ),
                      maxLines: 2, // لتجنب النصوص الطويلة
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // وقت الإشعار
              Text(
                time,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xFF6C6C6C),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h), // مسافة عمودية بين الإشعارات
        ],
      ),
    );
  }
}
