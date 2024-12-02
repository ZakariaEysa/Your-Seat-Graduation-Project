import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../widgets/confirm_part.dart';

class Otp extends StatefulWidget {
  static const String routeName = "confirm";

  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController N1 = TextEditingController();

  TextEditingController N2 = TextEditingController();

  TextEditingController N3 = TextEditingController();

  TextEditingController N4 = TextEditingController();

  TextEditingController N5 = TextEditingController();

  TextEditingController N6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // navigateTo(context: context, screen: const SignUp());
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const HeadAppBar(

            title: 'Confirm OTP code',
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'You just need to enter the OTP\nsent to the registered phone \n'
            '   number ',
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                ConfirmPart(
                  title: '',
                  controllers: N1,
                ),
                ConfirmPart(
                  title: '',
                  controllers: N2,
                ),
                ConfirmPart(
                  title: '',
                  controllers: N3,
                ),
                ConfirmPart(
                  title: '',
                  controllers: N4,
                ),
                ConfirmPart(
                  title: '',
                  controllers: N5,
                ),
                ConfirmPart(
                  title: '',
                  controllers: N6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 319.h),
            child: Text('00:59',
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 20)),
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonBuilder(
            text: 'Continue',
            onTap: () {
              // Navigate to HomeScreen after successful OTP verification
              navigateTo(context: context, screen: const HomeScreen());
            },
          ),
        ]));
  }
}
