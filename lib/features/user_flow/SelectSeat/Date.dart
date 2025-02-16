import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  final List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  final List<int> daysInMonths = [
    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  ];

  int selectedDay = 1;
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysInMonths.reduce((a, b) => a + b),
        itemBuilder: (context, index) {
          int totalDaysPassed = 0;
          int currentMonthIndex = 0;

          // Find the current month and day
          for (int i = 0; i < daysInMonths.length; i++) {
            if (index < totalDaysPassed + daysInMonths[i]) {
              currentMonthIndex = i;
              break;
            }
            totalDaysPassed += daysInMonths[i];
          }

          // Calculate the day in the month
          int dayInMonth = index - totalDaysPassed + 1;

          // Format the day and month to always show two digits
          String formattedDay = dayInMonth.toString().padLeft(2, '0');
          String formattedMonth = months[currentMonthIndex];

          // Check if the current date is selected
          bool isSelected = currentMonthIndex == selectedMonthIndex && dayInMonth == selectedDay;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMonthIndex = currentMonthIndex;
                selectedDay = dayInMonth;
              });
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
              child: Container(
                width: 59.w,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF09FBD3) : Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.sp),
                    Text(
                      formattedMonth,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 15.h),
                    Container(
                      width: 56.w,
                      height: 54.5.h,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF1D1D1D) : const Color(0xFF3B3B3B),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          formattedDay,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
