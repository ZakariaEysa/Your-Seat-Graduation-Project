import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAsk extends StatelessWidget {
  const ChatAsk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF27125B),
      width: 390.w,
      height: 80.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Row(
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'ask me here...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0XFF6C6363),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 280,
                      ),
                      child: Image.asset(
                        'assets/images/karf(6).png',
                        width: 280,
                        height: 300,
                        fit: BoxFit.cover,
                        color: const Color(0xFF27125B),
                      ),
                    ),
                  ]),
                ),
                Image.asset('assets/icons/send.png',
                    width: 39.5, height: 54, fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
