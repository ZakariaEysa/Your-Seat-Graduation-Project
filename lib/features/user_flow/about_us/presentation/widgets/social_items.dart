import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialItem extends StatelessWidget {
  final String url;

  final List<BoxShadow>? boxShadow;
  const SocialItem({super.key, required this.url, this.boxShadow});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 41.h,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.fill,
          ),
          boxShadow: boxShadow),
    );
  }
}
