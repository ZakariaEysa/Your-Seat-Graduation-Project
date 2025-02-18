import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import '../../../now_playing/presentation/widgets/playing_movies.dart';

import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../movie_details/presentation/views/movie_details.dart';

class CinemaMovies extends StatelessWidget {
  final String cinemaId;

  const CinemaMovies({super.key, required this.cinemaId});

  Future<List<Map<String, dynamic>>> _fetchMoviesByCinema() async {
    try {
      // جلب السينما المختارة
      final snapshot = await FirebaseFirestore.instance
          .collection('Cinemas')
          .doc(cinemaId) // استخدام السينما المختارة
          .get();

      if (snapshot.exists) {
        var cinemaData = snapshot.data();
        var movies = cinemaData?['movies'] as List;
        return movies.map((movie) => movie as Map<String, dynamic>).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching movies: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return FutureBuilder<List<Map<String, dynamic>>>(  // تعديل هنا
      future: _fetchMoviesByCinema(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text(lang.errorSavingUser));
        }

        final movies = snapshot.data!;

        return Padding(
          padding: EdgeInsets.only(left: 8.0.w, top: 8.0.h),
          child: GridView.builder(
            shrinkWrap: true, // This removes the scroll within the GridView
            physics: NeverScrollableScrollPhysics(), // This disables scrolling for the GridView
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20.h,
              crossAxisCount: 2, // عدد الأعمدة
              crossAxisSpacing: 1.w,
              childAspectRatio: 0.45, // ضبط نسبة الأبعاد
            ),
            itemCount: movies.length,
            itemBuilder: (context, movieIndex) {
              final movieData = movies[movieIndex];
              final movie = MoviesDetailsModel.fromJson(movieData);

              return GestureDetector(
                onTap: () {
                  navigateTo(context: context, screen: MovieDetails(model: movie));
                },
                child: PlayingMovies(
                  movies: movie,
                  rate: movie.rating.toString(),
                  duration: movie.duration ?? "",
                  category: movie.category ?? "",
                  image: movie.posterImage ?? "",
                  title: movie.name ?? "",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
