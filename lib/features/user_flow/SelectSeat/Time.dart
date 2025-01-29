import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  final List<String> times = ['11:05', '14:15', '16:30', '17:00', '20:20'];
  int _selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
