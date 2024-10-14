import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/chatbot.dart';
import '../Widget/cinema_item.dart';
import '../Widget/coming_soon.dart';
import '../Widget/movie_carousel_widget.dart';
import '../Widget/search.dart';
import '../Widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 500.w,
            height: 900.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF2E1371), Color(0xFF130B2B)],
              ),
            ),
            child: SingleChildScrollView(
              // This makes the content scrollable
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/yourseat.png",
                        width: 190.w,
                        height: 125.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/icons/notification_icon.png",
                          width: 36.w,
                          height: 115.h,
                        ),
                      ),
                    ],
                  ),
                  const Search(),
                  SizedBox(height: 30.h),
                  TextWidget(text: "Now playing"),
                  SizedBox(height: 20.h), // Add some space
                  Container(
                    height: 500.sp, // Define a height for the carousel
                    child:
                        MovieCarouselWidget(), // Movie carousel remains scrollable inside
                  ),
                  TextWidget(text: "Coming soon"),
                  SizedBox(height: 10.h),
                  Container(
                    height: 400.h, // Height for the coming soon section
                    child:
                        ComingSoon(), // Horizontal list of coming soon movies
                  ),
                  Text(
                    "Promo & Discount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/discount.png"),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        "cinema",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CinemaItem(),
                  ),
                ],
              ),
            ),
          ),
          // Use the DraggableFloatingButton here
          const DraggableFloatingButton(),
        ],
      ),
    );
  }
}
