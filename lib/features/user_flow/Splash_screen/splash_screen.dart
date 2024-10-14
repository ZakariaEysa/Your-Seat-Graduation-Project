import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../home/presentation/views/home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      navigateAndReplace(context: context, screen: const SignIn());
    });
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
       "assets/images/splash.png" ,
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
