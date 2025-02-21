import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/hive_keys.dart';
import '../../../../data/hive_stroage.dart';
import '../widgets/NotifactionContent.dart';
import '../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/app_bar/head_appbar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28.sp,
        ),
        title: HeadAppBar(
          title: lang.notifications,
        ),
        backgroundColor: const Color(0xFF2E1371),
      ),

      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w),
            child: Align(
              alignment: HiveStorage.get(HiveKeys.isArabic)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(end: 30.w),
                    child: Text(
                      lang.general,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 20.w, top: 7.h),
                    child: Container(
                      height: 2.h,
                      width: 90.w,
                      color: const Color(0xFFAB44B0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
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
