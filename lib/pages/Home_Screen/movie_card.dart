
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final int index;
  MovieCard({required this.index});

  final List<String> movieImages = [
    'assets/images/film2.png', // Guardians of the Galaxy
    'assets/images/film1.png', // Avengers Infinity War
    'assets/images/film3.png', // Batman v Superman
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          movieImages[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}