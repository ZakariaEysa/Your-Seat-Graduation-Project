import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:yourseatgraduationproject/resources/app_styles_manager.dart';
import 'package:yourseatgraduationproject/resources/color_manager.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({
    super.key,
    this.onTap,
    this.label,
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

  final String? label;
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
    return SizedBox(
      width: width ?? 333.w,
      height: height ?? 60.h,
      child: TextFormField(
        onTap: onTap,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxlines! ? 1 : null,
        expands: maxlines! ? false : true,
        controller: controller,
        obscureText: obsecure!,
        textAlignVertical: textAlignVer ?? TextAlignVertical.top,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
          filled: true,
          fillColor: const Color(0xff2E126E).withOpacity(.4),
          prefixIcon: imagePath != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    imagePath!,
                    width: 10,
                    height: 10,
                    fit: BoxFit.fill,
                  ),
                )
              : (prefixIcon ??
                  (isIcon == true
                      ? Icon(prefix, color: const Color(0xFFA8A6A6))
                      : null)),
          suffixIcon: suffixIcon ??
              (obsecure!
                  ? IconButton(
                      icon: const Icon(Icons.remove_red_eye,
                          color: Colors.white54),
                      onPressed: () {
                        // Toggle password visibility here if needed
                      },
                    )
                  : null),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(
              color: const Color(0x40000000),
              width: .8,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(
              color: const Color(0xFF78028A).withOpacity(.6),
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: disabledBorder ??
                const BorderSide(width: 40, color: Colors.indigo),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.indigo),
            borderRadius: BorderRadius.circular(30),
          ),
          labelStyle: const TextStyle(color: Color(0xFFA8A6A6)),
        ),
      ),
    );
  }
}
