import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../app_bar/appbar.dart';

class ScaffoldF extends StatelessWidget {
  const ScaffoldF(
      {super.key,
      this.bottomNavigationBar,
      required this.body,
      this.title,
      this.actions});

  final Widget? bottomNavigationBar;
  final Widget body;
  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
          width: 500.w,
          height: 900.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [theme.primaryColor, theme.colorScheme.secondary],
            ),
          ),
          child: body),
      appBar: title != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: BuilderAppBar(
                actions: actions,
                title: title ?? "",
              ))
          : null,
    );
  }
}
