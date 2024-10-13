import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/app_styles_manager.dart';
import '../../resources/color_manager.dart';

class BuilderAppBar extends StatelessWidget {
  const BuilderAppBar({
    super.key,
    this.title = "",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // forceMaterialTransparency: true,
      // shadowColor: ColorManager.primaryW,
      backgroundColor: const Color(0xff2D136E),
      title: Text(
        title,
        style: AppStylesManager.customTextStyleBl
            .copyWith(fontSize: 28.sp, color: ColorManager.primaryW),
      ),
      centerTitle: true,
    );
  }
}
