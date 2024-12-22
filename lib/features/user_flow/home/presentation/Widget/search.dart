import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: .01, color: Color(0x4DD9D9D9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: .01,
              color: Color(0xffffffff),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Image.asset(
              "assets/icons/search.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
          hintText: lang.search,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: 14.sp,
            fontFamily: 'SF Pro',
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          filled: true, //
          fillColor: const Color(0x4DD9D9D9),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
