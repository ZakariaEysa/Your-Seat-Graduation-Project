import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAsk extends StatelessWidget {
  const ChatAsk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF27125B),
      width: 390.w,
      height: 96.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Row(
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  // decoration: ShapeDecoration(
                  //     color: Colors.white.withOpacity(0.8799999952316284),
                  //     shape: RoundedRectangleBorder(
                  //       side: const BorderSide(
                  //         width: 1,
                  //         strokeAlign: BorderSide.strokeAlignOutside,
                  //         color: Color(0xFF030000),
                  //       ),
                  //       borderRadius: BorderRadius.circular(9),
                  //     ),
                  //     shadows: const [
                  //       BoxShadow(
                  //         color: Color(0x3F000000),
                  //         blurRadius: 4,
                  //         offset: Offset(0, 4),
                  //         spreadRadius: 0,
                  //       )
                  //     ]),

                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
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
                ),
                Image.asset(
                  'assets/icons/send.png',
                  width: 55,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
