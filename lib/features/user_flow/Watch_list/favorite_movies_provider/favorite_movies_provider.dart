import 'package:flutter/material.dart';
import '../../../../data/hive_stroage.dart';
import '../../../../utils/app_logs.dart';
import '../../movie_details/data/model/movies_details_model/movies_details_model.dart';

class FavoriteMoviesProvider extends ChangeNotifier {
  final List<MoviesDetailsModel> _favoriteMovies = [];

  List<MoviesDetailsModel> get favoriteMovies => _favoriteMovies;

  void addMovie(MoviesDetailsModel movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie);

      notifyListeners();
    }
  }

  void removeMovie(MoviesDetailsModel movie) {
    _favoriteMovies.remove(movie);
    notifyListeners();
  }
}
