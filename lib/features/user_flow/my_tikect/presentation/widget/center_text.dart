import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return           Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 400, 0, 0),
      child: Column(
        children: [
          Container(
            width: 350.w,
            height: 156.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20, 0, 0, 0),
                      child: Image.asset(
                        "assets/icons/money.png",
                        width: 28.w,
                        height: 15.h,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '210.000 VND',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20, 0, 0, 0),
                      child: Image.asset(
                        "assets/icons/location.png",
                        width: 28.w,
                        height: 15.h,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Vincom Ocean Park',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      "assets/icons/img_2.png",
                      width: 28.w,
                      height: 15.h,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 318.w,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        50, 0, 0, 0),
                    child: Text(
                      '4th floor, Vincom Ocean Park, Da Ton, Gia Lam, Ha Noi',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          25, 0, 0, 10),
                      child: Image.asset("assets/icons/img_3.png" , width: 22.w, height: 22.h,),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Show this QR code to the ticket counter to \nreceive your ticket',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
