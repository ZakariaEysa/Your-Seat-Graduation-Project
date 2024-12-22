import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/features/user_flow/onBoarding/OnBoarding.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../auth/presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _navigate);
  }

  void _navigate() {
    if (HiveStorage.get(HiveKeys.passUserOnboarding) == false) {
      navigateAndReplace(context: context, screen: const OnBoarding());
    } else if (HiveStorage.get(HiveKeys.role) == "" ||
        HiveStorage.get(HiveKeys.role) == null) {
      navigateAndReplace(
        context: context,
        screen: const SignIn(),
      );
    } else {
      navigateAndReplace(
        context: context,
        screen: const HomeLayout(),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: 1.sw, // width based on screen size
        height: 1.sh, // height based on screen size
        child: Center(
          child: SizedBox(
            width: 305.w, // relative width
            height: 260.h, // relative height
            child: Image.asset("assets/images/splash.png"),
          ),
        ),
      )
          .animate()
          .then()
          .shimmer(duration: const Duration(milliseconds: 900))
          .then()
          .shimmer(duration: const Duration(milliseconds: 900)),
    );
  }
}
