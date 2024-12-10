import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class ChatAsk extends StatelessWidget {
  const ChatAsk({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: const Color(0xFF27125B),
            width: 390.w,
            height: 80.h,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 16, left: 16, top: 16),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: const Alignment(1.1, 0.8),
                        children: [
                          TextField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF27125B),
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: lang.askmehere,
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
                            fit: BoxFit.cover,
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
            ),
          ),
        ],
      ),
    );
  }
}
