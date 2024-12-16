import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
import 'package:yourseatgraduationproject/features/user_flow/card/presentation/views/card_refund.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/views/chat_bottt.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/views/cinema_details.dart';
import 'package:yourseatgraduationproject/features/user_flow/forget/presentation/views/forget.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/views/movie_details.dart';
import 'package:yourseatgraduationproject/features/user_flow/new%20password/presentation/views/new_password.dart';
import 'package:yourseatgraduationproject/features/user_flow/now_playing/presentation/widgets/app.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment_refund.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment_done/presentation/views/payment_successful.dart';
import 'package:yourseatgraduationproject/services/simple_bloc_observer_service.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/widgets/application_theme/applicaton_theme.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'features/user_flow/Settings/presentation/views/profile_card.dart';
import 'features/user_flow/Splash_screen/splash_screen.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'features/user_flow/auth/domain/model/google_user_model.dart';
import 'features/user_flow/auth/domain/model/user_model.dart';
import 'features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';
import 'features/user_flow/card/presentation/views/card.dart';
import 'features/user_flow/payment_done/presentation/views/refund_successful.dart';
import 'features/user_flow/payment_policy/presentation/views/payment_policy.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
      appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
      messagingSenderId: '556627768143',
      projectId: 'yourseatgraduationprojec-19068',
    ),
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  // // Initialize Firebase App Check
  // await FirebaseAppCheck.instance.activate();

  // // Set the language code for Firebase Auth to avoid locale warning
  // FirebaseAuth.instance.setLanguageCode('en');  // or use 'ar' for Arabic

  // WidgetsFlutterBinding.ensureInitialized();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: const FirebaseOptions(
  //             apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
  //             appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
  //             messagingSenderId: '556627768143',
  //             projectId: 'yourseatgraduationprojec-19068'))
  //     : await Firebase.initializeApp();
  // // await Firebase.initializeApp();

  //  await FirebaseAppCheck.instance.activate(

  //   webProvider: ,
  //   webRecaptchaSiteKey: 'your-recaptcha-site-key', // required only for web
  // );
  SimpleBlocObserverService();

  await HiveStorage.init();
  // HiveStorage.set(HiveKeys.isArabic, false);
  // HiveStorage.set(
  //   HiveKeys.role,
  //   "",
  // );
//  HiveStorage.set(
//     HiveKeys.isArabic,
//     false,
  // );
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
  // HiveStorage.set(
  //   HiveKeys.role,
  //   "",
  // );
  // HiveStorage.set(
  //   HiveKeys.passUserOnboarding,
  //   false,
  // );
  // Register the adapter

  // Hive.registerAdapter(UserModelAdapter());

// open the box
  //  await Hive.openBox<UserModel>('userBox');

  // Register the adapter
  // Hive.registerAdapter(GoogleUserModelAdapter());


  // Open the box
  // await Hive.openBox<GoogleUserModel>('googleUserBox');

  GoogleUserModel? currentUser = HiveStorage.getGoogleUser();
  UserModel? currentUser2 = HiveStorage.getDefaultUser();


  AppLogs.errorLog(currentUser.toString());
  AppLogs.errorLog(currentUser2.toString());


  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(
      HiveKeys.isArabic,
      false,
    );
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SwitchLanguageCubit>(create: (context) => SwitchLanguageCubit(),),
     BlocProvider<AuthCubit>( create: (context) => AuthCubit(AuthRepoImpl(
         AuthRemoteDataSourceImpl(FirebaseAuth.instance, GoogleSignIn()))),
     ),
    ],
    child: const MyApp(),
  )


  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

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
                  home:MovieDetails(),

                );
              });
        });

  }
}
