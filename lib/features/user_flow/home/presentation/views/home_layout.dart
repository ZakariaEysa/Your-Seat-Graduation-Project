import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Settings/presentation/views/setting_page.dart';
import 'home_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../Tickets/presentation/view/tickets_screen.dart';
import '../../../Watch_list/presentation/views/watch_list.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeLayout> {
  void showCenteredSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w, // استخدام ScreenUtil للـ horizontal padding
              vertical: 12.h, // استخدام ScreenUtil للـ vertical padding
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(
                  8.r), // استخدام ScreenUtil للـ borderRadius
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp, // استخدام ScreenUtil للـ fontSize
              ),
            ),
          ),
        ),
      ),
    );

    // إظهار الـ SnackBar
    overlay.insert(overlayEntry);

    // إخفاء الـ SnackBar بعد 3 ثواني
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  Future<void> printUserLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showCenteredSnackBar(
          context, 'Location services are disabled. Please enable them.');
      await Geolocator.openLocationSettings(); // Open location settings
      return;
    }

    // Check and request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showCenteredSnackBar(context, 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showCenteredSnackBar(
        context,
        'Location permissions are permanently denied. Please enable them from app settings.',
      );
      await Geolocator
          .openAppSettings(); // Open app settings for manual permission
      return;
    }

    // Get current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      String message =
          'User location: ${position.latitude}, ${position.longitude}';
      print(message);
      showCenteredSnackBar(context, message);
    } catch (e) {
      print('Error getting location: $e');
      showCenteredSnackBar(context, 'Error getting location: $e');
    }
  }


  int selectedIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    WatchList(),
    TicketPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        color: const Color(0xFF27125B),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        buttonBackgroundColor: const Color(0xFF6E77C0),
        index: selectedIndex,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 0
                  ? const AssetImage("assets/icons/home_bold.png")
                  : const AssetImage("assets/icons/home.png"),
             color: Colors.white,
            ),
            label: selectedIndex == 0 ? lang.home : '',
            labelStyle:  TextStyle(color: Colors.white,  fontSize: 16.sp),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 1
                  ? const AssetImage("assets/icons/bold_watch_list.png")
                  : const AssetImage("assets/icons/watch_list_icon.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 1 ? lang.watchlist : '',
            labelStyle:  TextStyle(color: Colors.white,  fontSize: 16.sp),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 2
                  ? const AssetImage("assets/icons/ticket_bold.png")
                  : const AssetImage("assets/icons/ticket.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 2 ? lang.tickets : '',
            labelStyle: TextStyle(color: Colors.white,  fontSize:17.sp),

          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 3
                  ? const AssetImage("assets/icons/settings_bold.png")
                  : const AssetImage("assets/icons/settings.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 3 ? lang.settings : '',
            labelStyle: TextStyle(color: Colors.white,  fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
