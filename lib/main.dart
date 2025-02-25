import 'package:cloud_firestore/cloud_firestore.dart';
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

import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/remote_data_source/movie_details_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/repos_impl/movie_details_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'data/hive_stroage.dart';
import 'features/user_flow/Rate/Rate.dart';
import 'features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'features/user_flow/cinema_details/presentation/cubit/cinema_cubit.dart';
import 'features/user_flow/home/presentation/Widget/search/search_cubit/search_cubit.dart';
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
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  await Permission.camera.request();
  await Permission.storage.request();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
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

  // updateMovieTimes(
  //   cinemaId: "Point 90 Cinema", // معرف السينما
  //   movieName: "The Dark Knight", // اسم الفيلم
  //   targetDate: "2025-05-04", // التاريخ الذي تريد تعديله
  // );
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
          BlocProvider<MovieDetailsCubit>(
            create: (context) => MovieDetailsCubit(
                MovieDetailsRepoImpl(MovieDetailsRemoteDataSourceImpl())),
          ),
          BlocProvider<CinemaCubit>(
            create: (context) => CinemaCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
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
              navigatorObservers: [BotToastNavigatorObserver()],
              home: SplashScreen(),
            );
          });
    });
  }
}

Future<void> updateMovieTimes({
  required String cinemaId,
  required String movieName,
  required String targetDate, // التاريخ بصيغة "yyyy-MM-dd"
}) async {
  try {
    // 🔹 جلب مرجع السينما من Firestore
    DocumentReference cinemaRef =
        FirebaseFirestore.instance.collection('Cinemas').doc(cinemaId);

    // 🔹 جلب بيانات السينما
    DocumentSnapshot cinemaSnapshot = await cinemaRef.get();

    if (cinemaSnapshot.exists) {
      Map<String, dynamic>? cinemaData =
          cinemaSnapshot.data() as Map<String, dynamic>?;

      if (cinemaData != null && cinemaData.containsKey('movies')) {
        List<dynamic> moviesList = List.from(cinemaData['movies']);

        // 🔹 البحث عن الفيلم المطلوب
        int movieIndex =
            moviesList.indexWhere((movie) => movie['name'] == movieName);

        if (movieIndex != -1) {
          List<dynamic> timesList = List.from(moviesList[movieIndex]['times']);

          // 🔹 تحديث `times` لليوم المحدد فقط
          for (var i = 0; i < timesList.length; i++) {
            if (timesList[i]['date'] == targetDate) {
              timesList[i] = {
                "date": targetDate,
                "time": [
                  {
                    "time": "14:00",
                    "reservedSeats": ["1", "2", "3"]
                  },
                  {
                    "time": "16:30",
                    "reservedSeats": ["4", "5"]
                  },
                  {
                    "time": "19:00",
                    "reservedSeats": ["8", "9"]
                  }
                ]
              };
            }
          }

          // 🔹 تحديث Firestore بالبيانات الجديدة
          moviesList[movieIndex]['times'] = timesList;
          await cinemaRef.update({'movies': moviesList});

          print(
              "✅ تم تحديث أوقات الفيلم '$movieName' في السينما '$cinemaId' لليوم $targetDate.");
        } else {
          print(
              "⚠️ لم يتم العثور على الفيلم '$movieName' في السينما '$cinemaId'.");
        }
      } else {
        print("⚠️ لا توجد أفلام في السينما '$cinemaId'.");
      }
    } else {
      print("⚠️ لم يتم العثور على سينما بالمعرّف '$cinemaId'.");
    }
  } catch (e) {
    print("❌ خطأ أثناء تحديث الأوقات: $e");
  }
}
