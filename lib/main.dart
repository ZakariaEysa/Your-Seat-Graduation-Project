import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:yourseatgraduationproject/features/user_flow/SelectSeat/SelectSeat.dart';
import 'data/hive_stroage.dart';
import 'features/user_flow/Rate/Rate.dart';
import 'features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'services/simple_bloc_observer_service.dart';
import 'widgets/application_theme/applicaton_theme.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'features/user_flow/Splash_screen/splash_screen.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/user_flow/Watch_list/favorite_movies_provider/favorite_movies_provider.dart';
import 'features/user_flow/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'features/user_flow/auth/data/repos_impl/auth_repo_impl.dart';

// Future<void> renameDocument(
//     String collectionName, String oldDocId, String newDocId) async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   DocumentReference oldDocRef =
//       firestore.collection(collectionName).doc(oldDocId);
//   DocumentReference newDocRef =
//       firestore.collection(collectionName).doc(newDocId);

//   try {
//     // جلب البيانات من الوثيقة القديمة
//     DocumentSnapshot oldDoc = await oldDocRef.get();

//     if (oldDoc.exists) {
//       // نسخ البيانات إلى الوثيقة الجديدة
//       await newDocRef.set(oldDoc.data());

//       // حذف الوثيقة القديمة
//       await oldDocRef.delete();

//       print("تمت إعادة تسمية الوثيقة بنجاح من $oldDocId إلى $newDocId");
//     } else {
//       print("⚠ الوثيقة القديمة غير موجودة!");
//     }
//   } catch (e) {
//     print("❌ حدث خطأ أثناء إعادة التسمية: $e");
//   }
// }

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

  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);
  SimpleBlocObserverService();

  await HiveStorage.init();

  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(HiveKeys.passUserOnboarding, false);
  }

  // GoogleUserModel? currentUser = HiveStorage.getGoogleUser();
  // UserModel? currentUser2 = HiveStorage.getDefaultUser();

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }

  // await renameDocument('Cinemas', '4DX Cinema', 'Point 90 Cinema');

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      // enabled: false,
      builder: (context) => MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteMoviesProvider()),
          BlocProvider<SwitchLanguageCubit>(
            create: (context) => SwitchLanguageCubit(),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(AuthRepoImpl(
                AuthRemoteDataSourceImpl(
                    FirebaseAuth.instance, GoogleSignIn()))),
          ),
        ],
        child: const MyApp(),
      ),
    ),
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
              // builder: DevicePreview.appBuilder,
              builder: (context, child) {
                child = BotToastInit()(context, child); // تهيئة BotToast
                return DevicePreview.appBuilder(context, child);
              },
              navigatorObservers: [
                BotToastNavigatorObserver()
              ], // ملاحظة التنقل
              home: SplashScreen(),
              // home:SelectSeat()
            );
          });
    });
  }
}
