import 'package:flutter/material.dart';
import 'coming_card.dart';


class ComingSoon extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'Avatar 2: The Way of Water',
      'genre': 'Adventure, Sci-fi',
      'date': '20.12.2022',
      'image': 'assets/images/avatar.png',
    },
    {
      'title': 'Ant Man Wasp: Quantumania',
      'genre': 'Adventure, Sci-fi',
      'date': '25.12.2022',
      'image': 'assets/images/img.png',
    },
    {
      'title': 'Fox puss in Boots: The last Wish',
      'genre': 'Adventure',
      'date': '27.12.2022',
      'image': 'assets/images/kot.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(
     viewportFraction: 0.5,
        initialPage: 1,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: ComingCard(
            title: movie['title']!,
            genre: movie['genre']!,
            date: movie['date']!,
            imageUrl: movie['image']!,
          ),
        );
      },
    );
  }
}
