import 'package:flutter/material.dart';
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
          const Text(
            'You just need to enter the OTP\nsent to the registered phone \n'
            '   number ',
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 320),
            child: Text('00:59',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          const SizedBox(
            height: 5,
          ),
          ButtonBuilder(
            text: 'Continue',
            ontap: () {},
          ),
        ]));
  }
}
