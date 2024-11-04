import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';


class TextWidget extends StatelessWidget {
  String text;

   TextWidget({super.key, required this.text ,});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(

            text,
            style: TextStyle(
              color: Color(0xFFF2F2F2),
              fontSize: 24.sp,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              height: 0.05.h,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(right: 10.0),
          child: Row(
            children:  [
              Text(
                "lang.seeall",
                style: TextStyle(
                  color: Color(0xFFFCC434),
                  fontSize: 15.sp,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0.11.h,
                ),
              ),
              Icon(Icons.arrow_forward_ios ,
                color: Color(0xFFFCC434),
                size: 16.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
