import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yourseatgraduationproject/resources/app_styles_manager.dart';

import 'package:yourseatgraduationproject/resources/color_manager.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({
    super.key,
    required this.label,
    this.onChanged,
    required this.controller,
    required this.type,
    this.width,
    this.suffix,
    this.obsecure = false,
    this.color,
    this.validator,
    this.prefix,
    this.isIcon = true,
    this.prefixWidget,
    this.height,
    this.noIcon = false,
    this.maxlines = true,
    this.textAlign,
    this.disabledBorder,
    this.textAlignVer,
    this.enabledBorder,
    this.onSubmitted,
  });

  final String label;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final bool? obsecure;
  final bool? isIcon;
  final bool? noIcon;
  final Widget? suffix;
  final IconData? prefix;
  final Widget? prefixWidget;
  final TextEditingController? controller;
  final TextInputType? type;
  final double? width;
  final double? height;
  final Color? color;
  final String? Function(String?)? validator;
  final bool? maxlines;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVer;
  final BorderSide? disabledBorder;
  final BorderSide? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: decorationWithFade(),
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height ?? 50.h,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxlines! ? 1 : null,
        expands: maxlines! ? false : true,
        controller: controller,
        obscureText: obsecure!,
        textAlignVertical: textAlignVer ?? TextAlignVertical.top,
        style: TextStyle(
          color: color,
        ),
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        keyboardType: type,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: disabledBorder ??
                const BorderSide(width: 1, color: Color(0xDCEBECFF)),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.primaryW),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: enabledBorder ??
                const BorderSide(width: 1, color: Color(0xDCEBECFF)),
            borderRadius: BorderRadius.circular(12),
          ),

          suffixIcon: suffix,
          prefixIcon: noIcon! ? null : prefixWidget,
          // prefix: prefixWidget,
          hintMaxLines: 5,
          hintText: label,
          hintStyle: color == null
              ? AppStylesManager.customTextStyleBl
              : TextStyle(
                  color: color,
                ),
        ),
      ),
    );
  }
}
