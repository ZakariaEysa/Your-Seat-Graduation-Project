import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primaryW,
        bottomNavigationBar: bottomNavigationBar,
        body: body,
        appBar: title != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(50.h),
                child: BuilderAppBar(
                  title: title ?? "",
                ))
            : null,
      ),
    );
  }
}
