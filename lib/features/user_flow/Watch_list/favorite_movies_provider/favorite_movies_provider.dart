

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../utils/app_logs.dart';
// import '../../movie_details/data/model/movies_details_model/movies_details_model.dart';
//
// class FavoriteMoviesProvider extends ChangeNotifier {
//   List<MoviesDetailsModel> _favoriteMovies = [];
//
//   List<MoviesDetailsModel> get favoriteMovies => _favoriteMovies;
//
//   FavoriteMoviesProvider() {
//     _loadFavoriteMovies(); // تحميل البيانات عند إنشاء الكلاس
//   }
//
//   void addMovie(MoviesDetailsModel movie) async {
//     if (!_favoriteMovies.contains(movie)) {
//       _favoriteMovies.add(movie);
//       await _saveFavoriteMovies();
//       notifyListeners();
//     }
//   }
//
//   void removeMovie(MoviesDetailsModel movie) async {
//     _favoriteMovies.remove(movie);
//     await _saveFavoriteMovies();
//     notifyListeners();
//   }
//
//   Future<void> _saveFavoriteMovies() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       List<String> movieList =
//       _favoriteMovies.map((movie) => jsonEncode(movie.toJson())).toList();
//       await prefs.setStringList('favorite_movies', movieList);
//     } catch (e) {
//       AppLogs.errorLog("Error saving favorite movies: $e");
//     }
//   }
//
//   Future<void> _loadFavoriteMovies() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       List<String>? movieList = prefs.getStringList('favorite_movies');
//       if (movieList != null) {
//         _favoriteMovies =
//             movieList.map((movie) => MoviesDetailsModel.fromJson(jsonDecode(movie))).toList();
//         notifyListeners();
//       }
//     } catch (e) {
//       AppLogs.errorLog("Error loading favorite movies: $e");
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/model/movies_details_model/movies_details_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../data/hive_keys.dart';
import '../../../../data/hive_stroage.dart';

class FavoriteMoviesProvider extends ChangeNotifier {

  var currentUser;

  final List<MoviesDetailsModel> _favoriteMovies = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<MoviesDetailsModel> get favoriteMovies => _favoriteMovies;

  /// 🟢 تحميل قائمة الأفلام من Firestore
  Future<void> loadFavoriteMovies(String userId) async {

    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {

        currentUser = HiveStorage.getGoogleUser();

    } else {

        currentUser = HiveStorage.getDefaultUser();

    }
    try {
      final userDoc = await _firestore.collection('users').doc(currentUser.email).get();
      if (userDoc.exists && userDoc.data()!.containsKey('watch_list')) {
        List<dynamic> watchListData = userDoc['watch_list'];

        _favoriteMovies.clear();
        _favoriteMovies.addAll(
            watchListData.map((movie) => MoviesDetailsModel.fromJson(movie))
        );

        notifyListeners();
      }
    } catch (e) {
      print("Error loading watch list: $e");
    }
  }

  /// 🟢 إضافة فيلم إلى قائمة المفضلة في Firestore
  Future<void> addMovie( MoviesDetailsModel movie) async {
    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {

      currentUser = HiveStorage.getGoogleUser();

    } else {

      currentUser = HiveStorage.getDefaultUser();

    }
    try {
      if (!_favoriteMovies.any((m) => m.name == movie.name)) {
        _favoriteMovies.add(movie);
        notifyListeners();

        await _firestore.collection('users').doc(currentUser.email).update({
          'watch_list': FieldValue.arrayUnion([movie.toJson()])
        });
      }
    } catch (e) {
      print("Error adding movie: $e");
    }
  }

  /// 🔴 إزالة فيلم من قائمة المفضلة في Firestore
  Future<void> removeMovie( MoviesDetailsModel movie) async {
    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {

      currentUser = HiveStorage.getGoogleUser();

    } else {

      currentUser = HiveStorage.getDefaultUser();

    }
    try {
      _favoriteMovies.removeWhere((m) => m.name == movie.name);
      notifyListeners();

      await _firestore.collection('users').doc(currentUser.email).update({
        'watch_list': FieldValue.arrayRemove([movie.toJson()])
      });
    } catch (e) {
      print("Error removing movie: $e");
    }
  }
}
