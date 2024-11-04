import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/repos/auth_repo.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';

import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/utils/service_locator.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../auth/presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      navigateAndReplace(
          context: context,
          screen: BlocProvider(
            create: (context) => AuthCubit(AuthRepoImpl(
                AuthRemoteDataSourceImpl(
                    FirebaseAuth.instance, GoogleSignIn()))),
            child:  SignIn(),
          ));
    });
    var mediaQuery = MediaQuery.of(context).size;
    return ScaffoldF(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Image.asset(
          "assets/images/splash.png",

           fit: BoxFit.cover,
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
