import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/remote_data_source/movie_details_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/repos_impl/movie_details_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import 'data/hive_stroage.dart';
import 'features/user_flow/Watch_list/presentation/cubit/watch_list_cubit.dart';
import 'features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'features/user_flow/cinema_details/presentation/cubit/cinema_cubit.dart';
import 'features/user_flow/home/presentation/Widget/Cinema_item/Cubit/item_cubit.dart';
import 'features/user_flow/now_playing/cubit/coming_soon_cubit.dart';
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
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/coming_soon/coming_soon.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/cubit/movies_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/movie_carousel_widget.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> showLocalNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'Your Channel Name',
    channelDescription: 'Your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // notification ID
    title,
    body,
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

Future<void> requestPermissions() async {
  await Permission.camera.request();
  await Permission.storage.request();
  await Permission.location.request();
}

late final FirebaseMessaging messaging;

Future<void> setupFirebaseMessaging() async {
  messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission();
  print('🔔 User granted permission: ${settings.authorizationStatus}');

  final token = await messaging.getToken();
  print("📱 FCM Token: $token");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('💡 New message: ${message.notification?.title}');
    if (message.notification != null) {
      _showMessage(
          "📢 ${message.notification!.title}: ${message.notification!.body}");
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('🚀 Opened app via message: ${message.notification?.title}');
    _showMessage(
        "🚀 ${message.notification?.title}: ${message.notification?.body}");
  });
}

Future<void> printUserLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    _showMessage('Location services are disabled. Please enable them.');
    await Geolocator.openLocationSettings();
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      _showMessage('Location permissions are denied.');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    _showMessage(
        'Location permissions are permanently denied. Please enable them from app settings.');
    await Geolocator.openAppSettings();
    return;
  }

  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String message =
        'User location: ${position.latitude}, ${position.longitude}';
    print(message);
    _showMessage(message);
  } catch (e) {
    print('Error getting location: $e');
    _showMessage('Error getting location: $e');
  }
}

void _showMessage(String message) {
  AppLogs.debugLog(message);
  showLocalNotification("📢 تنبيه", message); // Notification local
}

Future<void> requestCameraAndLocationPermissions() async {
  final cameraStatus = await Permission.camera.request();
  if (cameraStatus.isGranted) {
    print("تم منح صلاحية الكاميرا ✅");
  } else if (cameraStatus.isDenied) {
    print("تم رفض صلاحية الكاميرا ❌");
  } else if (cameraStatus.isPermanentlyDenied) {
    print("صلاحية الكاميرا مرفوضة نهائياً، افتح الإعدادات يدويًا ⚠️");
    await openAppSettings();
  }

  final locationStatus = await Permission.locationWhenInUse.request();
  if (locationStatus.isGranted) {
    print("تم منح صلاحية اللوكيشن ✅");
  } else if (locationStatus.isDenied) {
    print("تم رفض صلاحية اللوكيشن ❌");
  } else if (locationStatus.isPermanentlyDenied) {
    print("صلاحية اللوكيشن مرفوضة نهائياً، افتح الإعدادات يدويًا ⚠️");
    await openAppSettings();
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("رسالة في الخلفية: ${message.notification?.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
      appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
      messagingSenderId: '556627768143',
      projectId: 'yourseatgraduationprojec-19068',
    ),
  );

  await FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  requestCameraAndLocationPermissions();
  await setupFirebaseMessaging();

  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);
  SimpleBlocObserverService();

  await HiveStorage.init();

  if (HiveStorage.get(HiveKeys.isDark) == null) {
    HiveStorage.set(HiveKeys.isDark, true);
  }
  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(HiveKeys.passUserOnboarding, false);
  }

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }

  await initLocalNotifications(); // Initialize local notifications

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteMoviesProvider()),
          BlocProvider<SwitchLanguageCubit>(
              create: (context) => SwitchLanguageCubit()),
          BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(AuthRepoImpl(
                  AuthRemoteDataSourceImpl(
                      FirebaseAuth.instance, GoogleSignIn())))),
          BlocProvider<MovieDetailsCubit>(
              create: (context) => MovieDetailsCubit(
                  MovieDetailsRepoImpl(MovieDetailsRemoteDataSourceImpl()))),
          BlocProvider<CinemaCubit>(create: (context) => CinemaCubit()),
          BlocProvider<CinemaaItemCubit>(
              create: (context) => CinemaaItemCubit()),
          BlocProvider<MovieCarouselCubit>(
              create: (context) => MovieCarouselCubit()),
          BlocProvider<ComingSoonCubit>(create: (context) => ComingSoonCubit()),
          BlocProvider<WatchListCubit>(create: (context) => WatchListCubit())
        ],
        child: MyApp(),
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
    return ChangeNotifierProvider(
      create: (context) => ApplicationTheme(),
      child: Consumer<ApplicationTheme>(
        builder: (context, theme, child) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            useInheritedMediaQuery: true,
            ensureScreenSize: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                  theme: theme.currentTheme,
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
                  builder: (context, child) {
                    child = BotToastInit()(context, child);
                    return DevicePreview.appBuilder(context, child);
                  },
                  navigatorObservers: [BotToastNavigatorObserver()],
                  home: SplashScreen());
            },
          );
        },
      ),
    );
  }
}


// ScaffoldF(
//                   body: ElevatedButton(
//                     onPressed: () {
//                       showLocalNotification("عنوان الإشعار", "محتوى الإشعار");
//                     },
//                     child: Text("إظهار إشعار محلي"),
//                   ),
//                 ),