import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalStatusCard extends StatelessWidget {
  final String status;
  final String imagePath;

  VerticalStatusCard({
    required this.status,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
      child: Container(
        width: 36.w,
        height: 130.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2E1371),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: 9,
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 19),
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 30,
height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
