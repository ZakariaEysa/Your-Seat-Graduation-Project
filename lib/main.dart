import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'data/hive_stroage.dart';
import 'features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'features/user_flow/cinema_details/presentation/cubit/cinema_cubit.dart';
import 'features/user_flow/home/presentation/Widget/Cinema_item/Cubit/item_cubit.dart';
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


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
      appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
      messagingSenderId: '556627768143',
      projectId: 'yourseatgraduationprojec-19068',
    ),
  );

  await FirebaseAppCheck.instance.activate(androidProvider: AndroidProvider.debug);
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

  runApp(
    DevicePreview(
      enabled: kDebugMode,
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
          BlocProvider<CinemaaItemCubit>(
            create: (context) => CinemaaItemCubit(),
          ),
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
                theme: theme.currentTheme, // استخدم الثيم الحالي
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
                home:  SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

const String googleApiKey = 'AIzaSyD7VmrfzhvvuttRBIRVcWix-1eOjLtI1bU';



class RouteMapPage extends StatefulWidget {
  @override
  _RouteMapPageState createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  GoogleMapController? mapController;
  Set<Polyline> polylines = {};
  LatLng? currentLocation;
  LatLng? destination;

  @override
  void initState() {
    super.initState();
    _initLocationAndRoute();
  }

  Future<void> _initLocationAndRoute() async {
    try {
      // 1. احصل على الموقع الحالي
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });

      print("🚀 Current location: $currentLocation");

      // 2. اعمل تحويل اسم المكان لإحداثيات (مثال: "جامعة الفيوم")
      LatLng destinationLatLng = await _getLatLngFromPlaceName("جامعة الفيوم");
      setState(() {
        destination = destinationLatLng;
      });

      print("🎯 Destination location: $destinationLatLng");

      // 3. ارسم المسار
      await _drawRoute();
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  Future<LatLng> _getLatLngFromPlaceName(String place) async {
    final uri = Uri.https(
      "maps.googleapis.com",
      "/maps/api/geocode/json",
      {"address": place, "key": googleApiKey},
    );

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    if (data['status'] == "OK") {
      final location = data['results'][0]['geometry']['location'];
      return LatLng(location['lat'], location['lng']);
    } else {
      throw Exception("Failed to fetch location: ${data['status']}");
    }
  }

  Future<void> _drawRoute() async {
    if (currentLocation == null || destination == null) return;

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
        destination: PointLatLng(destination!.latitude, destination!.longitude),
        mode: TravelMode.driving,
      ),
      googleApiKey: googleApiKey,
    );

    print("📍 Route status: ${result.status}");
    print("📌 Points count: ${result.points.length}");

    if (result.points.isNotEmpty) {
      List<LatLng> routePoints = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      setState(() {
        polylines.add(Polyline(
          polylineId: PolylineId("route"),
          color: Colors.blue,
          width: 5,
          points: routePoints,
        ));
      });
    } else {
      throw Exception("No route found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route Map")),
      body: currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation!,
          zoom: 14,
        ),
        polylines: polylines,
        onMapCreated: (controller) => mapController = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}










// class RouteMapPage extends StatefulWidget {
//   const RouteMapPage({Key? key}) : super(key: key);
//
//   @override
//   State<RouteMapPage> createState() => _RouteMapPageState();
// }
//
// class _RouteMapPageState extends State<RouteMapPage> {
//   Completer<GoogleMapController> _controller = Completer();
//   LatLng _currentLocation = LatLng(29.309948, 30.841800); // المسلة
//   LatLng _destinationLocation = LatLng(29.308960, 30.896508); // جامعة الفيوم
//
//   Set<Polyline> _polylines = {};
//   List<LatLng> _polylineCoordinates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _createRoute();
//   }
//
//   Future<void> _createRoute() async {
//     final polylinePoints = PolylinePoints();
//     final result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: googleMapsApiKey,
//       request: PolylineRequest(
//         origin: PointLatLng(
//             _currentLocation.latitude, _currentLocation.longitude),
//         destination: PointLatLng(
//             _destinationLocation.latitude, _destinationLocation.longitude),
//         mode: TravelMode.driving,
//       ),
//     );
//
//     if (result.points.isNotEmpty) {
//       _polylineCoordinates = result.points
//           .map((e) => LatLng(e.latitude, e.longitude))
//           .toList();
//
//       setState(() {
//         _polylines.add(Polyline(
//           polylineId: PolylineId('route'),
//           points: _polylineCoordinates,
//           color: Colors.blue,
//           width: 5,
//         ));
//       });
//
//       final controller = await _controller.future;
//       controller.animateCamera(CameraUpdate.newLatLngBounds(
//         LatLngBounds(
//           southwest: LatLng(
//             _currentLocation.latitude <= _destinationLocation.latitude
//                 ? _currentLocation.latitude
//                 : _destinationLocation.latitude,
//             _currentLocation.longitude <= _destinationLocation.longitude
//                 ? _currentLocation.longitude
//                 : _destinationLocation.longitude,
//           ),
//           northeast: LatLng(
//             _currentLocation.latitude >= _destinationLocation.latitude
//                 ? _currentLocation.latitude
//                 : _destinationLocation.latitude,
//             _currentLocation.longitude >= _destinationLocation.longitude
//                 ? _currentLocation.longitude
//                 : _destinationLocation.longitude,
//           ),
//         ),
//         100,
//       ));
//     } else {
//       print("❌ Unable to get route: ${result.errorMessage}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('الاتجاهات')),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _currentLocation,
//           zoom: 13,
//         ),
//         onMapCreated: (controller) => _controller.complete(controller),
//         markers: {
//           Marker(
//             markerId: MarkerId('current'),
//             position: _currentLocation,
//             infoWindow: InfoWindow(title: ' مستشفي الندي التخصصي ب الفيوم'),
//           ),
//           Marker(
//             markerId: MarkerId('destination'),
//             position: _destinationLocation,
//             infoWindow: InfoWindow(title: 'جامعة الفيوم'),
//           ),
//         },
//         polylines: _polylines,
//       ),
//     );
//   }
// }
