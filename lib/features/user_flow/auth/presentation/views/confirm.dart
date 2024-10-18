import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../widgets/confirm_part.dart';

class Confirm extends StatelessWidget {
  static const String routeName = "confirm";
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const BuilderAppBar(
            title: 'Confirm OTP code',
          ),
          Text(
            'You just need to enter the OTP\nsent to the registered phone \n'
            '   number ',
            style: TextStyle(color: Colors.white, fontSize:20.sp),
            textAlign: TextAlign.center,
          ),
        SizedBox(
            height:40.h,
          ),
          Padding(
            padding:EdgeInsets.only(left:20.w, right: 20.w),
            child: Row(
              children: [
                ConfirmPart(title: ''),
                ConfirmPart(title: ''),
                ConfirmPart(title: ''),
                ConfirmPart(title: ''),
                ConfirmPart(title: ''),
                ConfirmPart(title: ''),
              ],
            ),
          ),
           SizedBox(
            height: 30.h,
          ),
           Padding(
            padding: EdgeInsets.only(left: 320.h),
            child: Text('00:59',
                style: TextStyle(color: Colors.white, fontSize:20.sp)),
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonBuilder(
            text: 'Continue',
            ontap: () {},
          ),
        ]));
  }
}
