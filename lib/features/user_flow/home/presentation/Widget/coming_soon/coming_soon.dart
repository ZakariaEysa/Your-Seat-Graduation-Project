// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'coming_card.dart';
//
//
// class ComingSoon extends StatefulWidget {
//
//    ComingSoon({super.key});
//
//   @override
//   State<ComingSoon> createState() => _ComingSoonState();
// }
//
// class _ComingSoonState extends State<ComingSoon> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     _fetchMovies();
//   }
//   List<Map<String, dynamic>> movies = [];
//
//   Future<void> _fetchMovies() async {
//     try {
//       final snapshot = await FirebaseFirestore.instance.collection('Movies').get();
//       final fetchedMovies = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//       setState(() {
//         movies = fetchedMovies;
//       });
//     } catch (e) {
//       print("Error fetching movies: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(movies.isEmpty){
//       return Center(child: CircularProgressIndicator());
//     }
//     return PageView.builder(
//       controller: PageController(
//      viewportFraction: 0.5,
//         initialPage: 1,
//       ),
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         final movie = movies[index];
//
//         return Padding(
//           padding: const EdgeInsets.all(5),
//           child: ComingCard(
//             title: movie['title']!,
//             genre: movie['genre'],
//             date: movie['date']!,
//             imageUrl: movie['image']!,
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/navigation.dart';
import '../../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../../movie_details/presentation/views/movie_details.dart';
import 'coming_card.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  List<Map<String, dynamic>> movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies(); // Fetch movies on initialization
  }

  Future<void> _fetchMovies() async {
    try {
      // Fetch movies from Firestore "Movies" collection
      final snapshot =
          await FirebaseFirestore.instance.collection('Movies').get();
      final fetchedMovies = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading spinner while data is being fetched
    if (movies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Build a PageView with the fetched movies
    return PageView.builder(
      controller: PageController(
        viewportFraction: 0.5, // Adjust size of the cards
        initialPage: 1,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: (){
            navigateTo(context: context, screen: MovieDetails(model: MoviesDetailsModel.fromJson(movies[index]),));


          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ComingCard(
              title: movie['name'] ?? 'Unknown Title',
              genre: movie['category'] ?? 'Unknown Category',
              date: movie['release_date'] ?? 'Unknown Date',
              imageUrl:
                  movie['poster_image'] ?? 'https://via.placeholder.com/300',
            ),
          ),
        );
      },
    );
  }
}
