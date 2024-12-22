import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class PersonalInfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final String? info;

  const PersonalInfoCard({
    super.key,
    required this.icon,
    required this.title,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            AssetImage(
              icon,
            ),
            size: 25.sp,
            color: Colors.white,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            title,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                info ?? "",
                textAlign: TextAlign.end,
                style: theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
