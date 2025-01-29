import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const HeadAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     // Display back button if onBackPressed is provided
    //     // if (onBackPressed != null)
    //     //   IconButton(
    //     //     icon: Icon(Icons.arrow_back, color: Colors.white),
    //     //     onPressed: onBackPressed,
    //     //   ),

    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 20.h, end: 85.w),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
