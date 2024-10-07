import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/resources/color_manager.dart';

import '../data/hive_keys.dart';

class AppStylesManager {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const AppStylesManager({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
  //! app Style manager add more TextStyle if needed

  // example
  static TextStyle customTextStyleBl = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w700,
    color: ColorManager.primaryBL2,
    fontFamily: HiveStorage.get(HiveKeys.isArabic) ? 'GE Dinar One' : 'Manrope',
  );

  // example

  static List<BoxShadow> customBoxShadow() {
    return [
      const BoxShadow(
        color: Color(0x16949494),
        blurRadius: 14,
        offset: Offset(0, -14),
        spreadRadius: 0,
      ),
      const BoxShadow(
        color: Color(0x11949494),
        blurRadius: 16,
        offset: Offset(0, -28),
        spreadRadius: 0,
      ),
    ];
  }

  // example
  static ShapeDecoration buildContainerDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFE8EAED)),
        borderRadius: BorderRadius.circular(8.sp),
      ),
    );
  }
}
