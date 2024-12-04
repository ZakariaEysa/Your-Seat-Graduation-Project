import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Notifaction/NotifactionContent.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/app_bar/head_appbar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang=S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28.sp, // ضبط حجم الأيقونة باستخدام ScreenUtil
        ),
        title:  HeadAppBar(
          title: lang.notifications,
        ),
        backgroundColor: const Color(0xFF2E1371),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h), // مسافة عمودية باستخدام ScreenUtil

          Padding(
            padding:
                EdgeInsetsDirectional.only(start: 5.w), // حافة أفقية باستخدام ScreenUtil
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 20.w), // حافة داخلية باستخدام ScreenUtil
                    child: Text(
                      lang.general,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18.sp, // ضبط حجم النص باستخدام ScreenUtil
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 12.w, top: 7.h), // ضبط الحواف
                    child: Container(
                      height: 2.h, // ارتفاع الخط باستخدام ScreenUtil
                      width: 90.w, // عرض الخط باستخدام ScreenUtil
                      color: const Color(0xFFAB44B0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h), // مسافة إضافية باستخدام ScreenUtil
          Expanded(
            child: ListView(
              children: const [
                NotificationContent(
                  imagePath: 'assets/images/notif1.png',
                  body:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                  numOfNotification: '2',
                ),
                NotificationContent(
                  imagePath: 'assets/images/notif2.png',
                  body:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                  numOfNotification: '2',
                ),
                NotificationContent(
                  imagePath: 'assets/images/notif3.png',
                  body:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                ),
                NotificationContent(
                  imagePath: 'assets/images/notif4.png',
                  body:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n10 Hrs ago.',
                ),
                NotificationContent(
                  imagePath: 'assets/images/notif5.png',
                  body:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n15 Hrs ago.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
