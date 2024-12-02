import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return SizedBox(
      height: 350.h,
      child: Padding(
        padding:  EdgeInsets.all(35.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                navigatePop(context: context);
              },
              child: Container(
                padding:  EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.white,width: 3.w)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.dark,style: theme.textTheme.labelLarge,),
                    Icon(Icons.check_rounded,color: Colors.white,size: 25.sp,)
                  ],
                ),
              ),
            ),

            SizedBox(height: 50.h,),
            GestureDetector(
                onTap: () {
                  navigatePop(context: context);
                },
                child: Text(lang.light,style: theme.textTheme.labelLarge))
          ],
        ),
      ),
    );
  }
}
