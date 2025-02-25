import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../about_us/presentation/views/about_us.dart';

class QrState extends StatelessWidget {
   QrState({super.key});
  Map<String,dynamic> ahmed = {
    "ahmed" : "1235",
    "cinema" : "Plaza",
    "movie" : "Avengers"
    };
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsetsDirectional.fromSTEB(0, 560.h, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 70.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QrImageView(
                    data: ahmed.toString(),
                    size: 150,
                    backgroundColor: Colors.white,
                  ),
                Column(
                  children: [
                    Text(
                      "Payment : paymed",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Status    :      Active",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          "Download ticket",
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            print('Image clicked!');
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 5.w),
                            child: Image.asset(
                              "assets/icons/img_4.png",
                              width: 15.w,
                              height: 15.h,
                            ),
                          ),
                        ),
                      ],
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
