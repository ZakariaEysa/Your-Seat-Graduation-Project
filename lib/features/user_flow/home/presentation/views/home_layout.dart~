import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../Tickets/presentation/view/tickets_screen.dart';
import '../../../Watch_list/presentation/views/watch_list.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const WatchList(),
    TicketPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
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
            label: selectedIndex == 0 ? lang.home : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 1
                  ? const AssetImage("assets/icons/bold_watch_list.png")
                  : const AssetImage("assets/icons/watch_list_icon.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 1 ? lang.watchlist : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 2
                  ? const AssetImage("assets/icons/ticket_bold.png")
                  : const AssetImage("assets/icons/ticket.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 2 ? lang.tickets : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              selectedIndex == 3
                  ? const AssetImage("assets/icons/settings_bold.png")
                  : const AssetImage("assets/icons/settings.png"),
              color: Colors.white,
            ),
            label: selectedIndex == 3 ? lang.settings : '',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
