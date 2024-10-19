import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/views/settings_screen.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String imageIcon;
  final VoidCallback? onPress;
  const SettingsItem({super.key, required this.title, required this.imageIcon,required this.onPress});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      width: 304.w,
      height: 57.h,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0x54D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageIcon,
            width: 25,
            height: 25,
          ),
          Text(title,style: theme.textTheme.bodySmall,),
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
