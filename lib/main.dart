import 'dart:async';
import 'dart:convert';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/user_flow/movie_details/data/remote_data_source/movie_details_remote_data_source.dart';
import 'features/user_flow/movie_details/data/repos_impl/movie_details_repo_impl.dart';
import 'features/user_flow/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'utils/app_logs.dart';
import 'widgets/scaffold/scaffold_f.dart';
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
import 'features/user_flow/Watch_list/favorite_movies_provider/favorite_movies_provider.dart';
import 'features/user_flow/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'features/user_flow/auth/data/repos_impl/auth_repo_impl.dart';
import 'features/user_flow/home/presentation/Widget/coming_soon/coming_soon.dart';
import 'features/user_flow/home/presentation/Widget/cubit/movies_cubit.dart';
import 'features/user_flow/home/presentation/Widget/movie_carousel_widget.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
  DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print('Notification clicked: ${response.payload}');
    },
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
    showWhen: true,
  );

  const DarwinNotificationDetails iOSPlatformChannelSpecifics =
  DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
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

// Future<void> setupFirebaseMessaging() async {
//   messaging = FirebaseMessaging.instance;
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//     provisional: false,
//   );
//
//   print('🔔 User granted permission: ${settings.authorizationStatus}');
//
//   final token = await messaging.getToken();
//   print("📱 FCM Token: $token");
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Message in foreground: ${message.data}');
//     if (message.notification != null) {
//       showLocalNotification(
//         message.notification!.title ?? 'New Notification',
//         message.notification!.body ?? '',
//       );
//     }
//   });
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message opened app!');
//     if (message.notification != null) {
//       showLocalNotification(
//         message.notification!.title ?? 'New Notification',
//         message.notification!.body ?? '',
//       );
//     }
//   });
//
//   RemoteMessage? initialMessage = await messaging.getInitialMessage();
//   if (initialMessage != null && initialMessage.notification != null) {
//     showLocalNotification(
//       initialMessage.notification!.title ?? 'New Notification',
//       initialMessage.notification!.body ?? '',
//     );
//   }
// }

Future<void> setupFirebaseMessaging() async {
  try {
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    print('✅ Notification permission status: ${settings.authorizationStatus}');

    final token = await messaging.getToken();
    print('✅ FCM Token: $token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 Foreground message: ${message.messageId}');
      if (message.notification != null) {
        showLocalNotification(
          message.notification!.title ?? 'New Notification',
          message.notification!.body ?? '',
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📬 App opened from message');
      if (message.notification != null) {
        showLocalNotification(
          message.notification!.title ?? 'Opened Notification',
          message.notification!.body ?? '',
        );
      }
    });

    final RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print('🟡 App opened from terminated state: ${initialMessage.messageId}');
      if (initialMessage.notification != null) {
        showLocalNotification(
          initialMessage.notification!.title ?? 'Initial Notification',
          initialMessage.notification!.body ?? '',
        );
      }
    }

  } catch (e, stackTrace) {
    print('🔥 ERROR in setupFirebaseMessaging: $e');
    print(stackTrace);
  }
}


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('📩 Background message: ${message.messageId}');
  await Firebase.initializeApp();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  if (message.notification != null) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      channelDescription: 'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title ?? 'New Notification',
      message.notification!.body ?? '',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
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

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await HiveStorage.init();
  await initLocalNotifications();

  if (HiveStorage.get(HiveKeys.isDark) == null) {
    HiveStorage.set(HiveKeys.isDark, true);
  }

  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(HiveKeys.passUserOnboarding, false);
  }

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }

  SimpleBlocObserverService();

  await setupFirebaseMessaging();

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteMoviesProvider()),
          BlocProvider(create: (_) => SwitchLanguageCubit()),
          BlocProvider(
            create: (_) => AuthCubit(
              AuthRepoImpl(AuthRemoteDataSourceImpl(
                FirebaseAuth.instance,
                GoogleSignIn(),
              )),
            ),
          ),
          BlocProvider(
            create: (_) => MovieDetailsCubit(
              MovieDetailsRepoImpl(MovieDetailsRemoteDataSourceImpl()),
            ),
          ),
          BlocProvider(create: (_) => CinemaCubit()),
          BlocProvider(create: (_) => CinemaaItemCubit()),
          BlocProvider(create: (_) => MovieCarouselCubit()),
          BlocProvider(create: (_) => ComingSoonCubit()),
          BlocProvider(create: (_) => WatchListCubit()),
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
    return ChangeNotifierProvider(
      create: (_) => ApplicationTheme(),
      child: Consumer<ApplicationTheme>(
        builder: (context, theme, _) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, __) => MaterialApp(
              key: key,
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
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}


