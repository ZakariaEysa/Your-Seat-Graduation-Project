import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:yourseatgraduationproject/pages/Home_Screen/home_screen.dart';
import 'Settings/settings_screen.dart';
import 'Tickets/tickets_screen.dart';
import 'Watch_list/watch_list_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";
  const HomeLayout({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeLayout> {
  // Set the default index to 3 for HomeScreen
  int selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    TicketPage(),
    WatchListPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xff140B2D),
        color: const Color(0xFF27125B),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        buttonBackgroundColor: Color(0xFF6E77C0),
        index: selectedIndex,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 0
                  ? AssetImage("assets/icons/home_bold.png")
                  : AssetImage("assets/icons/home.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 0 ? 'Home' : '',labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 1
                  ? AssetImage("assets/icons/watch_list_bold.png")
                  : AssetImage("assets/icons/watch_list.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 1 ? 'Watch List' : '',labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 2
                  ? AssetImage("assets/icons/ticket_bold.png")
                  : AssetImage("assets/icons/ticket.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 2 ? 'Ticket' : '',labelStyle: TextStyle(color: Colors.white),
          ),

          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 3
                  ? AssetImage("assets/icons/settings_bold.png")
                  : AssetImage("assets/icons/settings.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 3 ? 'Settings' : '' ,labelStyle: TextStyle(color: Colors.white),
          ),
        ],

      ),
    );
  }
}
