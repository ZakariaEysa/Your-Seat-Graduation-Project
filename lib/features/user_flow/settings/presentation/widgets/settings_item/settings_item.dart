import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String imageIcon;
  final VoidCallback? onPress;
  const SettingsItem(
      {super.key,
      required this.title,
      required this.imageIcon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    S.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      width: 304.w,
      height: 70.h,
      padding: EdgeInsets.all(16.sp),
      decoration: ShapeDecoration(
        color: const Color(0xff401C8B).withOpacity(.6),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageIcon,
            width: 25.w,
            height: 25.h,
          ),
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: theme.colorScheme.onPrimary,
          )
        ],
      ),
    );
  }
}
