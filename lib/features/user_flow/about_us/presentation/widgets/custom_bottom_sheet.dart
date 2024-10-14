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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.sp),
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
                        horizontal: 15.sp, vertical: 15.sp),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: innerScrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20.h),
                        if (bottomWidget != null)
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20.0),
                            child: bottomWidget,
                          ),
                        SizedBox(height: 120.h),
                      ],
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
