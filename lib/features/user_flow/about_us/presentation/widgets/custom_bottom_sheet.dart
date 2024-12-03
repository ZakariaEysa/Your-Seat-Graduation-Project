import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../resources/app_styles_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  final double initialHeight;
  final double maxHeight;
  final double minHeight;
  final DraggableScrollableController scrollController;
  final String content;
  final Widget? bottomWidget;
  final String title;

  const CustomBottomSheet({
    super.key,
    required this.initialHeight,
    required this.maxHeight,
    required this.minHeight,
    required this.scrollController,
    required this.content,
    this.bottomWidget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w), // تعديل باستخدام ScreenUtil
      child: DraggableScrollableSheet(
        controller: scrollController,
        initialChildSize: initialHeight,
        minChildSize: minHeight,
        maxChildSize: maxHeight,
        expand: false,
        builder:
            (BuildContext context, ScrollController innerScrollController) {
          return Container(
            decoration: AppStylesManager.backGroundDecorations(),
            child: Column(
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    double newSize = scrollController.size -
                        (details.delta.dy / MediaQuery.of(context).size.height);
                    if (newSize >= 0 && newSize <= 1) {
                      scrollController.jumpTo(newSize);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w, // تعديل باستخدام ScreenUtil
                      vertical: 15.h, // تعديل باستخدام ScreenUtil
                    ),
                    child: Text(
                      title,
                      style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp), // استخدام ScreenUtil لضبط الحجم
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: innerScrollController,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.w), // تعديل باستخدام ScreenUtil
                      child: Column(
                        children: [
                          SizedBox(height: 10.h), // تعديل باستخدام ScreenUtil
                          Text(
                            content,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 12.sp), // استخدام ScreenUtil لضبط الحجم
                          ),
                          SizedBox(height: 20.h), // تعديل باستخدام ScreenUtil
                          if (bottomWidget != null)
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 20.h), // تعديل باستخدام ScreenUtil
                              child: bottomWidget,
                            ),
                          SizedBox(height: 120.h), // تعديل باستخدام ScreenUtil
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
