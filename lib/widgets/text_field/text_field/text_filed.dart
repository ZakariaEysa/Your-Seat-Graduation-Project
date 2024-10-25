import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFiled extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? type;

  const TextFiled({super.key, required this.hintText, required this.icon, required this.isPassword, this.controller, this.type,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 326,
      height: 60,
      child: TextField(
        obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey,fontSize: 13.sp),
              filled: true,
              fillColor: const Color(0xff2E126E).withOpacity(.4),
              prefixIcon: Icon(icon, color: const Color(0xFFA8A6A6)),
              suffixIcon: isPassword
                  ? IconButton(
                icon: const Icon(Icons.remove_red_eye, color: Colors.white54),
                onPressed: () {
                  // Toggle password visibility
                },
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Colors.black26.withOpacity(.8), // Stroke color
                  width:.8,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Colors.black26.withOpacity(1), // Stroke color when focused
                  width:1.0,
                ),
              ),
          ),
          ),
    );

}
  }

