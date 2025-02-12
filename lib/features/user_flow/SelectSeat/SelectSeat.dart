import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/app_bar/head_appbar.dart';
import '../../../widgets/scaffold/scaffold_f.dart';
import '../home/presentation/views/home_screen.dart';
import 'Date.dart';
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

    return ScaffoldF(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          ),
        ),
        backgroundColor: theme.primaryColor,
        title: Padding(
          padding: EdgeInsets.only(left: 31.w, bottom: 15.h),
          child: const HeadAppBar(title: 'Select Seat'),
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
                SizedBox(width: 10.w),
                 Left(),
                SizedBox(width: 12.w),
                 Right(),
              ],
            ),
            SizedBox(height: 15.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                seatsType(color: const Color(0xFFF3F3F3), text: 'Available'),
                seatsType(color: const Color(0xDCB6116B), text: 'Reserved'),
                seatsType(color: const Color(0xFF09FBD3), text: 'Selected'),
              ],
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                Image.asset(
                  "assets/images/HandRight.png",
                  width: 50.w,
                  height: 25.h,
                ),
                Text(
                  'The seat selected is VIP.',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            Center(
              child: Text(
                'Select Date & Time',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5.h),

            Date(),


        SizedBox(height: 10.h,),

            SizedBox(
              height: 60.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTimeIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w),
                      decoration: BoxDecoration(
                        color: _selectedTimeIndex == index
                            ? const Color(0xFF321131)
                            : const Color(0xFF1E1E1E),
                        border: _selectedTimeIndex == index
                            ? Border.all(color: const Color(0xFF09FBD3), width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          times[index],
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          //  SizedBox(height: 6.h),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 20.sp),
                      ),
                      Text(
                        '210.000 EGP',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20.sp,
                          color: const Color(0xFF09FBD3),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF09FBD3),
                      minimumSize: Size(155.w, 42.h),
                    ),
                    child: Text(
                      'Buy Ticket',
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
