import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static bool isDark = true;

  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFF2E1371),
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF2E1371),
        secondary: const Color(0xFF130B2B),
        seedColor: const Color(0xFF2E1371),
      ),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFB7935F),
        selectedIconTheme: IconThemeData(color: Colors.black, size: 52),
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: GoogleFonts.inter(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
          bodySmall: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black)));

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xFF2E1371),
      colorScheme: ColorScheme.fromSeed(
        onPrimary: Colors.white,
        primary: const Color(0xFF2E1371),
        secondary: const Color(0xFF130B2B),
        seedColor: const Color(0xFF2E1371),
      ),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
            height: 0.03.h,
            letterSpacing: -0.41.sp,
          ),
          centerTitle: true),
      textTheme: TextTheme(
        labelLarge: GoogleFonts.aDLaMDisplay(
            fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white
        ),
          titleLarge: GoogleFonts.acme(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          titleMedium: GoogleFonts.pottaOne(
              fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
          bodyLarge: GoogleFonts.inter(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.white),
          bodySmall: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white)),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Color(0xFF2C126A)));
}
