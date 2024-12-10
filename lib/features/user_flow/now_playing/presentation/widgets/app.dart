import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../home/presentation/views/home_layout.dart';
import '../views/coming_soon.dart';
import '../views/now_playing.dart';

class App extends StatefulWidget {
  final int initialTab;

  const App({super.key, this.initialTab = 0});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context); // Localization instance
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialTab,
      child: Scaffold(
        backgroundColor: const Color(0xFF2E1371).withOpacity(.99),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F0A2B).withOpacity(.02),
          elevation: 0,
          leadingWidth: 30,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context); // الرجوع إلى الشاشة السابقة
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
          title: Container(
            width: 314.w,
            height: 41.h,
            decoration: BoxDecoration(
              color: const Color(0xFF0F0A2B).withOpacity(.30),
              borderRadius:
              BorderRadius.circular(12), // Apply BorderRadius here
            ),
            child: TabBar(
              labelColor: const Color(0xFFEB68E3), // Selected tab text color
              unselectedLabelColor: Colors.white, // Unselected tab text color
              indicatorColor: const Color(0xFFEB68E3), // Highlight color
              labelStyle: theme.textTheme.labelLarge!.copyWith(fontSize: 17.sp),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Tab(text: lang.nowPlaying),
                ),
                Tab(text: lang.comingSoon),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            NowPLaying(), // The Now Playing page
            ComingSoons(), // The Coming Soon page
          ],
        ),
      ),
    );
  }
}
