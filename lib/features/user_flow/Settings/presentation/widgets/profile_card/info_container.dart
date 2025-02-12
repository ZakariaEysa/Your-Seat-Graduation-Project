import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class InfoContainer extends StatefulWidget {
  final String? title;

  final TextEditingController controller;
  final Function(String) onChanged;
  final TextInputType type;
  const InfoContainer(
      {required this.title,
      super.key,
      required this.controller,
      required this.type,
      required this.onChanged});

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
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
          onChanged: widget.onChanged,
          textAlign: TextAlign.start,
          controller: widget.controller,
        ),
      ),
    );
  }
}
