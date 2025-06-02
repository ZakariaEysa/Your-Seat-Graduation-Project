import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/cubit/movies_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  MovieCarouselCubit() : super(MovieCarouselLoading());

  Future<void> fetchMovies() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('playing now films')
          .get();
      final movies = snapshot.docs.map((doc) => doc.data()).toList();
      emit(MovieCarouselLoaded(movies));
    } catch (e) {
      emit(MovieCarouselError("Error fetching movies: $e"));
    }
  }
}
