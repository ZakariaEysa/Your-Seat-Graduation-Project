import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0x54D9D9D9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide.none,
          ),
          prefixIcon: _isFocused
              ? null // Remove the icon when focused
              : Padding(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset(
              "assets/icons/search.png",
              width: 24.w,
              height: 24.h,
            ),
          ),
          hintText: _isFocused ? '' : 'Search', // Remove hint text when focused
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
