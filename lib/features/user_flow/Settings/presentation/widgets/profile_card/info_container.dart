import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/text_field/text_field/text_form_field_builder.dart';

class InfoContainer extends StatelessWidget {
  final String? title;
  final TextEditingController controller;
  final TextInputType type;
  const InfoContainer(
      {required this.title,
      super.key,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        padding: EdgeInsets.all(15.sp),
        alignment: Alignment.centerLeft,
        width: 270.w,
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.r),
            color: theme.colorScheme.onSecondary),
        child: TextFormField(
         // initialValue: title,
         // initialValue: title,

          textAlign: TextAlign.start,
          controller: controller,
        ),
      ),
    );
  }
}
