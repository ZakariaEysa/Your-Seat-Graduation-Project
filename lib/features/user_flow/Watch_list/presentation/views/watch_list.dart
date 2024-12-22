import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';

import '../widgets/watch_list_part.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF2E1371),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
            child: HeadAppBar(
              title: lang.watchlist,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WatchListPart(
                image: 'assets/images/Avengers.png',
                title: 'Avengers: End Game',
                time: '2019 |3h 17 min',
                smallimage: 'assets/images/star.png',
                smalltitle: '8.9',
              ),
              Image.asset('assets/images/line.png'),
              const WatchListPart(
                image: 'assets/images/Venom.png',
                title: 'Venom 2',
                time: '2021 |1h 37 min',
                smallimage: 'assets/images/star2.png',
                smalltitle: '6.1',
              ),
              Image.asset('assets/images/line.png'),
              const WatchListPart(
                image: 'assets/images/boss.png',
                title: 'Boss Level',
                time: '2020 |2h 04 min',
                smallimage: 'assets/images/star2.png',
                smalltitle: '6.8',
              ),
              Image.asset('assets/images/line.png'),
              const WatchListPart(
                image: 'assets/images/Wrath.png',
                title: 'Wrath Of Man',
                time: '2021 |1h 56 min',
                smallimage: 'assets/images/star3.png',
                smalltitle: '5.3',
              ),
              Image.asset('assets/images/line.png'),
              const WatchListPart(
                image: 'assets/images/No.png',
                title: 'No Time To Die',
                time: '2021 |2h 17 min',
                smallimage: 'assets/images/star2.png',
                smalltitle: '7.8',
              ),
              // HomeLayout()
              //
            ],
          ),
        ));
  }
}
