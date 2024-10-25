import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yourseatgraduationproject/resources/app_styles_manager.dart';

import 'package:yourseatgraduationproject/resources/color_manager.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({

    super.key,
    this.onTap,
    required this.label,
    this.onChanged,
    required this.controller,
    required this.type,
    this.width,
    this.suffix,
    this.obsecure = true,
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
    this.icon,
    this.imagePath,
    this.suffixImagePath,
    this.prefixIcon,
    this.suffixIcon,
    this.hinitText,
  });

  final String label;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? imagePath;
  final String? suffixImagePath;
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
  final String? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hinitText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? 333.w,
      height: height ?? 55.h,
      child: TextFormField(
        
        onTap: onTap,
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
                const BorderSide(width: 40, color: Color(0xFFA8A6A6)),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.primaryW),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: enabledBorder ??
                const BorderSide(width: 1, color: Color(0xDCEBECFF)),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0xFFA8A6A6),
            fontSize: 13,
          ),
          labelStyle: const TextStyle(
            color: Color(0xFFA8A6A6),
          ),
          prefixIcon: imagePath != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    imagePath!,
                    width:10,
                    height: 10,
                    fit: BoxFit.fill,
                  ),
                )
              : null,
          suffixIcon: suffixIcon
        ),


      ),

    );
  }
}
