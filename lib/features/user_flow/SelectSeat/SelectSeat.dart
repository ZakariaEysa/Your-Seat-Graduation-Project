import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../data/hive_keys.dart';
import '../../../data/hive_stroage.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/app_bar/head_appbar.dart';
import '../../../widgets/scaffold/scaffold_f.dart';
import '../home/presentation/views/home_screen.dart';
import 'Date.dart';
import 'Time.dart';
import 'left.dart';
import 'right.dart';
import 'seatsType.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  int _selectedTimeIndex = 1;
  final List<String> times = ['11:05', '14:15', '16:30', '17:00', '20:20'];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => navigatePop(context: context),
        ),
        backgroundColor: theme.primaryColor,
        title: Padding(
          padding: EdgeInsets.only(left: 31.w, bottom: 15.h),
          child: HeadAppBar(title: lang.selectSeat),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 333.w,
              height: 3.h,
              color: const Color(0xFFF834FC),
            ),
            Center(
              child: Image.asset(
                "assets/images/shadwo.png",
                width: double.infinity,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15.w),
                Left(),
                Spacer(),
                Right(),
                SizedBox(width: 15.w),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                seatsType(color: const Color(0xFFF3F3F3), text: lang.available),
                seatsType(color: const Color(0xFF5b085d), text: lang.reserved),
                seatsType(color: const Color(0xFF09FBD3), text: lang.selected),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(
                  HiveStorage.get(HiveKeys.isArabic)
                      ? "assets/images/leftHand.png"
                      : "assets/images/HandRight.png",
                  width: 50.w,
                  height: 25.h,
                ),
                Text(
                  lang.theSeatSelectedIsVIP,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                lang.selectDateTime,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Date(),
            SizedBox(
              height: 10.h,
            ),
            Time(),
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.total,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 20.sp),
                      ),
                      Text(
                        lang.egp,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20.sp,
                          color: const Color(0xFF09FBD3),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF09FBD3),
                      minimumSize: Size(155.w, 42.h),
                    ),
                    child: Text(
                      lang.buyTicket,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 19.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
