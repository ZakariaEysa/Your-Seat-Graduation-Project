import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAsk extends StatelessWidget {
  const ChatAsk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF27125B), // خلفية الحاوية
      width: 390.w,
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.only(right: 8 , bottom: 16 , left: 16 , top: 16),
        child: Row(
          children: [
            Expanded(
              child: Stack(
alignment: Alignment(1.1, 0.8),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ask me here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0XFF6C6363),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/img_1.png',
                    width: 40.w,
                    height: 70.h,
fit:BoxFit.cover ,
                  ),
                ],
              ),
            ),

            Image.asset(
              'assets/icons/send.png',
              width: 48.w,
              height: 55.h,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
