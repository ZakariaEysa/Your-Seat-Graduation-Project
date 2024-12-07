import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/coming_movies.dart';

class ComingSoons extends StatefulWidget {
  const ComingSoons({super.key});

  @override
  State<ComingSoons> createState() => _ComingSoonsState();
}

class _ComingSoonsState extends State<ComingSoons> {
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          const ComingMovies(
            image: 'assets/images/film8.png',
            title: 'Avatar 2: The Way\nOf Water',
            smallTitle: 'Adventure, Sci-fi',
            releaseDate: '20.12.2022',
          ),
          SizedBox(
            width: 14.w,
          ),
          const ComingMovies(
            image: 'assets/images/film9.png',
            title: 'Ant Man Wasp:\nQuantumania',
            smallTitle: 'Adventure, Sci-fi',
            releaseDate: '25.12.2022',
          )
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          const ComingMovies(
            image: 'assets/images/film10.png',
            title: 'Shazam: Fury of the\nGods',
            smallTitle: 'Action, Sci-fi',
            releaseDate: '17.03.2023',
          ),
          SizedBox(
            width: 10.w,
          ),
          const ComingMovies(
            image: 'assets/images/film11.png',
            title: 'Fox puss in Boots:\nThe last Wish',
            smallTitle: 'Comdy,animation',
            releaseDate: '27.12.2022',
          )
        ],
      ),
      SizedBox(
        height: 40.h,
      )
    ])));
  }
}
