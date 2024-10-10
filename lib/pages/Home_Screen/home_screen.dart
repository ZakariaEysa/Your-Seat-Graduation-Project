
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/pages/Home_Screen/items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.only(bottom: 90.0),
        width: 500.sp,
        height: 900.sp,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF2E1371), Color(0xFF130B2B)],
          ),
        ),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/icons/notification_icon.png",
                    width: 36.sp,
                    height: 115.sp,
                  ),
                ),
                Image.asset(
                  "assets/images/yourseat.png",
                  width: 190.sp,
                  height: 125.sp,
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 340.sp,
              height: 51.sp,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Color(0x54D9D9D9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Image.asset("assets/icons/search.png"),
                ],
              ),
            ),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    // Text(
    //
    //   'Now playing',
    //   style: TextStyle(
    //     color: Color(0xFFF2F2F2),
    //     fontSize: 24,
    //     fontFamily: 'SF Pro',
    //     fontWeight: FontWeight.w700,
    //
    //   ),
    // )
  ],
)
           , SizedBox(height: 5.sp),

            Expanded(
              child: MovieCarouselWidget(),
            ),
          ],
        ),

      ),

    );

  }
}


