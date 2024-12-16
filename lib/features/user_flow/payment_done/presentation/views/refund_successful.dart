import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/button/button_builder.dart';

class RefundSuccessful extends StatelessWidget{
  const RefundSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(body:
    Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top:200.h),
          child: Image.asset("assets/images/check .png",width: 210.w,height: 210.h,),
        ),
        SizedBox(height: 31.h,),
        Text(lang.refundSuccessful,style:theme.textTheme.labelLarge!.copyWith(fontSize: 36.sp) ,textAlign: TextAlign.center,),
        SizedBox(height: 52.h,),
        ButtonBuilder(text:lang.ok, onTap: () {},width: 121.w,height: 48.h,)

      ],
    ));
  }

}