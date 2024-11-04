
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Notifaction/NotifactionContent.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_screen.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../utils/navigation.dart';
import '../../../widgets/app_bar/appbar.dart';
import '../auth/presentation/views/sign_in.dart';
import '../home/presentation/views/home_layout.dart';

class Notifaction extends StatelessWidget {
  const Notifaction({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ScaffoldF(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BuilderAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                navigateTo(context: context, screen: HomeScreen());
              },

            ),
            title: 'Notification',
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'General',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 12.w, top: 7.h),
                    child: Container(
                      height: 2, // Height of the line
                      width: 90, // Weight (width) of the line
                      color: Color(0xFFAB44B0), // Purple color
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                NotifactionContent(
                  imagePath: 'assets/images/notif1.png',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                  numOfNotifaction: '2',
                ),
                NotifactionContent(
                  imagePath: 'assets/images/notif2.png',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                  numOfNotifaction: '2',
                ),
                NotifactionContent(
                  imagePath: 'assets/images/notif3.png',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n1m ago.',
                ),
                NotifactionContent(
                  imagePath: 'assets/images/notif4.png',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '\n10 Hrs ago.',
                ),
                NotifactionContent(
                  imagePath: 'assets/images/notif5.png',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
