import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../generated/l10n.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return  SizedBox(
      height: 350.h,
      child: Padding(
        padding:  EdgeInsets.all(35.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding:  EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.white,width: 3.w)
              ),
              child: InkWell(
                onTap: (){
                  navigatePop(context: context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lang.english,style: theme.textTheme.labelLarge,),
                     Icon(Icons.check_rounded,color: Colors.white,size: 25.sp,)
                  ],
                ),
              ),
            ),

            SizedBox(height: 50.h,),
            GestureDetector(
                onTap: (){
                  navigatePop(context: context);
                },
                child: Text(lang.arabic,style: theme.textTheme.labelLarge))
          ],
        ),
      ),
    );
  }
}
