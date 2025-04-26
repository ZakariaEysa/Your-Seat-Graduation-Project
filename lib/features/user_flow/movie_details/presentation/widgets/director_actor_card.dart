import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/network_image/image_replacer.dart';

import '../../../../../generated/l10n.dart';

class Director extends StatelessWidget {
  final String name;
  final String imagePath;

  const Director({
    super.key,
    required this.name,
    required this.imagePath,
  });
  bool isBase64(String? imageUrl) {
    final base64Pattern = RegExp(r'^[A-Za-z0-9+/=]+$');
    return base64Pattern.hasMatch(imageUrl??"");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:  EdgeInsetsDirectional.only(end: 13.w),
        child: Container(
          height: 58.h,
          decoration: BoxDecoration(
            color: const Color(0xFF7427BF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [





              Padding(
                padding:  EdgeInsetsDirectional.only(start: 5.w),
                child:isBase64(imagePath)? ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.memory(base64Decode(imagePath) ,
                    fit: BoxFit.fill,
                    width: 50.w,
                    height: 50.h,
                  ),
                ):ImageReplacer(imageUrl: imagePath, fit: BoxFit.fill,isCircle: true,

                width: 50.w,
                  height: 50.h,
                ),
              ),
              SizedBox(width: 2.w),
              Padding(
                padding: EdgeInsets.only(right: 12.w, left: 11.w),
                child: Text(name,
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 12.sp)),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
