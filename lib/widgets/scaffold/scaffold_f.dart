import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/resources/constants.dart';

import '../../resources/color_manager.dart';
import '../app_bar/appbar.dart';

class ScaffoldF extends StatelessWidget {
  const ScaffoldF(
      {super.key, this.bottomNavigationBar, required this.body, this.title});

  final Widget? bottomNavigationBar;
  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
          padding: const EdgeInsets.only(bottom: 90.0),
          width: 500.sp,
          height: 900.sp,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF2E1371), Color(0xFF130B2B)],
            ),
          ),
          child: body),
      appBar: title != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: BuilderAppBar(
                title: title ?? "",
              )
      )
          : null,
    );
  }
}
