// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
// import '../../../movie_details/presentation/views/movie_details.dart';
// import '../../../../../utils/navigation.dart';
// import 'movie_card.dart';
//
// class MovieCarouselWidget extends StatefulWidget {
//   const MovieCarouselWidget({super.key});
//
//   @override
//   _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
// }
//
// class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
//   final PageController _pageController =
//   PageController(viewportFraction: 0.7, initialPage: 1);
//   int _currentPage = 1;
//   List<Map<String, dynamic>> movies = []; // List to hold movie data
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchMovies();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!.round();
//       });
//     });
//   }
//
//   Future<void> _fetchMovies() async {
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('playing now films')
//           .get();
//       final fetchedMovies = snapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();
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
//     if (movies.isEmpty) {
//       // Show loading spinner if movies are not loaded yet
//       return Center(child: CircularProgressIndicator());
//     }
//
//     return Stack(
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return AnimatedBuilder(
//                     animation: _pageController,
//                     builder: (context, child) {
//                       double value = 1.0;
//                       if (_pageController.position.haveDimensions) {
//                         value = _pageController.page! - index;
//                         value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//                       }
//                       return Center(
//                         child: Transform.scale(
//                           scale: Curves.easeOut.transform(value),
//                           child: Opacity(
//                             opacity: _currentPage == index ? 1.0 : 0.5,
//                             child: child,
//                           ),
//                         ),
//                       );
//                     },
//                     child: GestureDetector(
//
//                       onTap: (){
//                         navigateTo(context: context, screen: MovieDetails(model: MoviesDetailsModel.fromJson(movies[index]),));
//
//
//                       },
//                       child: MovieCard(
//                         movie: movies[index], // Pass movie data to the card
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           bottom: 60.h,
//           left: 0.w,
//           right: 0.w,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(5, (index) {
//               return AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: EdgeInsets.symmetric(horizontal: 5.sp),
//                 width: _currentPage == index ? 40.w : 10.w,
//                 height: 8.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.r),
//                   color: _currentPage == index
//                       ? const Color(0xffFCC434)
//                       : const Color(0xff2E2E2E),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/cubit/movies_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/cubit/movies_state.dart';

import '../../../../../utils/navigation.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../movie_details/presentation/views/movie_details.dart';
import 'movie_card.dart';

class MovieCarouselWidget extends StatefulWidget {
  const MovieCarouselWidget({super.key});

  @override
  State<MovieCarouselWidget> createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  final PageController _pageController =
      PageController(viewportFraction: 0.7, initialPage: 1);
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    context.read<MovieCarouselCubit>().fetchMovies();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
      builder: (context, state) {
        if (state is MovieCarouselLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieCarouselError) {
          return Center(child: Text(state.message));
        } else if (state is MovieCarouselLoaded) {
          final movies = state.movies;

          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            double value = 1.0;
                            if (_pageController.position.haveDimensions) {
                              value = _pageController.page! - index;
                              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                            }
                            return Center(
                              child: Transform.scale(
                                scale: Curves.easeOut.transform(value),
                                child: Opacity(
                                  opacity: _currentPage == index ? 1.0 : 0.5,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              print(MoviesDetailsModel().crewImages);
                              navigateTo(
                                context: context,
                                screen: MovieDetails(
                                  model: MoviesDetailsModel.fromJson(
                                      movies[index]),
                                ),
                              );
                            },
                            child: MovieCard(movie: movies[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 45.h,
                left: 0.w,
                right: 0.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      width: _currentPage == index ? 40.w : 10.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: _currentPage == index
                            ? const Color(0xffFCC434)
                            : const Color(0xff2E2E2E),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
