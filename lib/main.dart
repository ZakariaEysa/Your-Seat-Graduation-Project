import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/Settings/presentation/views/settings_screen.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/services/simple_bloc_observer_service.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/widgets/application_theme/applicaton_theme.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'features/user_flow/Splash_screen/splash_screen.dart';
import 'features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';
import 'features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'features/user_flow/auth/presentation/views/sign_up.dart';
import 'features/user_flow/onBoarding/OnBoarding.dart';
import 'firebase_options.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: const FirebaseOptions(
  //             apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
  //             appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
  //             messagingSenderId: '556627768143',
  //             projectId: 'yourseatgraduationprojec-19068'))
  //     : await Firebase.initializeApp();
  await Firebase.initializeApp();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SimpleBlocObserverService();

  await HiveStorage.init();
  HiveStorage.set(
    HiveKeys.isArabic,
    false,
  );
  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(
      HiveKeys.passUserOnboarding,
      false,
    );
  }
  AppLogs.scussessLog(HiveStorage.get(HiveKeys.role).toString());
  // if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
  //   HiveStorage.set(
  //     HiveKeys.passUserOnboarding,
  //     false,
  //   );
  // }

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(
      HiveKeys.isArabic,
      true,
    );
  }
  runApp(BlocProvider<SwitchLanguageCubit>(
    create: (context) => SwitchLanguageCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchLanguageCubit, SwitchLanguageState>(
        builder: (context, state) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          ensureScreenSize: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              theme: ApplicationTheme.darkTheme,
              locale: HiveStorage.get(HiveKeys.isArabic)
                  ? const Locale('ar')
                  : const Locale('en'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              builder: BotToastInit(),
              // home:  Otp(),
              home: BlocProvider(
                create: (context) => AuthCubit(AuthRepoImpl(
                    AuthRemoteDataSourceImpl(
                        FirebaseAuth.instance, GoogleSignIn()))),
                child: SignUp(),
              ),
            );
          });
    });
  }
}
