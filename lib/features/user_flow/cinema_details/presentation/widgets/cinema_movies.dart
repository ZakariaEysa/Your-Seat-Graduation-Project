import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/remote_data_source/movie_details_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/repos_impl/movie_details_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../../../../../utils/navigation.dart';
import '../../../movie_details/presentation/views/movie_details.dart';
import '../../../now_playing/presentation/widgets/playing_movies.dart';
import '../cubit/cinema_cubit.dart';
import '../cubit/cinema_state.dart';

class CinemaMovies extends StatelessWidget {
  final String cinemaId;

  const CinemaMovies({super.key, required this.cinemaId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CinemaCubit()..fetchMoviesByCinema(cinemaId),
      child: BlocBuilder<CinemaCubit, CinemaState>(
        builder: (context, state) {
          if (state is CinemaMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CinemaMoviesError) {
            return Center(child: Text("Error loading movies"));
          } else if (state is CinemaMoviesLoaded) {
            final movies = state.movies;

            return Padding(
              padding: EdgeInsets.only(left: 8.0.w, top: 8.0.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.w,
                  childAspectRatio: 0.45,
                ),
                itemCount: movies.length,
                itemBuilder: (context, movieIndex) {
                  final movie = movies[movieIndex];

                  return BlocProvider(
                    create: (context) => MovieDetailsCubit(MovieDetailsRepoImpl(
                        MovieDetailsRemoteDataSourceImpl())),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                            context: context,
                            screen: MovieDetails(model: movie));
                      },
                      child: PlayingMovies(
                        movies: movie,
                        rate: movie.rating.toString(),
                        duration: movie.duration ?? "",
                        category: movie.category ?? "",
                        image: movie.posterImage ?? "",
                        title: movie.name ?? "",
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
