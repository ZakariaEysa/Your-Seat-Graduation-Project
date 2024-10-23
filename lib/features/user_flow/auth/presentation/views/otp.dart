import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_up.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../widgets/confirm_part.dart';

class Otp extends StatelessWidget {
  static const String routeName = "confirm";
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
           BuilderAppBar(
             actions: [
               IconButton(onPressed: (){
                 navigateTo(context: context, screen: const SignUp());
               }, icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,))
             ],
            title: 'Confirm OTP code',

          ),
         SizedBox(height: 40.h,),
          Text(
            'You just need to enter the OTP\nsent to the registered phone \n'
            '   number ',
            style:  theme.textTheme.bodySmall!.copyWith(fontSize:20),
            textAlign: TextAlign.center,
          ),
        SizedBox(
            height:50.h,
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
                style:  theme.textTheme.bodySmall!.copyWith(fontSize:20)),
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonBuilder(
            text: 'Continue',
            ontap: () {
              // Navigate to HomeScreen after successful OTP verification
              navigateTo(context: context, screen: const HomeScreen());
            },
          ),
        ]));
  }
}
