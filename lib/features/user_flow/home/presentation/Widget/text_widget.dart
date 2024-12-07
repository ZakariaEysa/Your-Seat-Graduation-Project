// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10,0,0,0),
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFFF2F2F2),
              fontSize: 24.sp,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              height: 0.05.h,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0,0,10,0),
          child: Row(
            children: [
              Text(
                lang.seeAll,
                style: TextStyle(
                  color: const Color(0xFFFCC434),
                  fontSize: 15.sp,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0.11.h,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xFFFCC434),
                size: 16.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
