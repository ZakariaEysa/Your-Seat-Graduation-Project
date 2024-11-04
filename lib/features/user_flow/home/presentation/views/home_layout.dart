import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_screen.dart';
import '../../../Settings/presentation/views/settings_screen.dart';
import '../../../Tickets/tickets_screen.dart';
import '../../../Watch_list/presentation/views/watch_list.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeLayout> {
  // Set the default index to 3 for HomeScreen
  int selectedIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const WatchList(),
    const TicketPage(),
    const SettingsPage(),
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
            label: selectedIndex == 0 ? 'Home' : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(

            child: ImageIcon(
              selectedIndex == 1
                  ?  const AssetImage('assets/icons/bold_watch_list.png'  )
                  : const AssetImage("assets/icons/watch_list_icon.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 1 ? 'Watch List' : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 2
                  ? const AssetImage("assets/icons/ticket_bold.png")
                  : const AssetImage("assets/icons/ticket.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 2 ? 'Ticket' : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 3
                  ? const AssetImage("assets/icons/settings_bold.png")
                  : const AssetImage("assets/icons/settings.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 3 ? 'Settings' : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
