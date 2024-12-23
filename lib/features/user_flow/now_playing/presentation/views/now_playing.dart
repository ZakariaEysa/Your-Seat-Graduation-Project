import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'package:yourseatgraduationproject/features/user_flow/now_playing/presentation/widgets/playing_movies.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../movie_details/presentation/views/movie_details.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  Future<List<MoviesDetailsModel>> _fetchMovies() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('playing now films')
          .get();
      return snapshot.docs
          .map((doc) => MoviesDetailsModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print("Error fetching movies: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      body: FutureBuilder<List<MoviesDetailsModel>>(
        future: _fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(lang.errorSavingUser));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(lang.errorSavingUser));
          }

          final movies = snapshot.data!;

          return Padding(
            padding: EdgeInsets.only(left: 8.0.w,top: 8.0.h),
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.45, // Adjust to fit the card design
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: (){
                    navigateTo(context: context, screen: MovieDetails(model:movie,));


                  },
                  child: PlayingMovies(
                      rate: movie.rating.toString(),
                      duration: movie.duration??"",
                      category: movie.category??"",
                      image: movie.posterImage??"",
                      title: movie.name??"",
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


