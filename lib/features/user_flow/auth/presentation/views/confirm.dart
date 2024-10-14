import 'package:flutter/material.dart';

import '../widgets/otp.dart';
class Confirm extends StatelessWidget {
  static const String routeName = "confirm";
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(
          0xFF2E1371,
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Confirm OTP code',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          titleSpacing: 40,
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2E1371), Color(0xFF1D1043)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 20, left: 50),
                child: Text(
                  'You just need to enter the OTP\nsent to the registered phone \n'
                  '   number ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    OTP(title: '7'),
                    OTP(title: '8'),
                    OTP(title: '4'),
                    OTP(title: '3'),
                    OTP(title: '9'),
                    OTP(title: '0'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 330),
                child: Text('00:59',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 197,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFFD9D9D9),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            color: Color(0xFFEB68E3),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      )),
                ),
              ),
            ])));
  }
}
