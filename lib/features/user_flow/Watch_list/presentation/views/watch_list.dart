// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/views/movie_details.dart';
// import 'package:yourseatgraduationproject/utils/navigation.dart';
// import '../../../../../data/hive_keys.dart';
// import '../../../../../data/hive_stroage.dart';
// import '../../../../../widgets/scaffold/scaffold_f.dart';
// import '../../../../../generated/l10n.dart';
// import '../../../../../widgets/app_bar/head_appbar.dart';
// import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
// import '../widgets/watch_list_part.dart';
//
// class WatchList extends StatefulWidget {
//   WatchList({super.key});
//
//   @override
//   _WatchListState createState() => _WatchListState();
// }
//
// class _WatchListState extends State<WatchList> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   var currentUser;
//   List<MoviesDetailsModel> watchList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchWatchList();
//   }
//
//   /// 🟢 جلب الأفلام من Firestore
//   Future<void> fetchWatchList() async {
//     if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
//       currentUser = HiveStorage.getGoogleUser();
//     } else {
//       currentUser = HiveStorage.getDefaultUser();
//     }
//
//     try {
//       DocumentSnapshot userDoc =
//       await _firestore.collection('users').doc(currentUser.email).get();
//
//       if (!userDoc.exists) {
//         print("❌ المستخدم غير موجود!");
//         return;
//       }
//
//       List<dynamic>? watchListData = userDoc['watch_list'];
//
//       if (watchListData == null || watchListData.isEmpty) {
//         print("🚀 لا توجد أفلام في قائمة المشاهدة");
//         return;
//       }
//
//       setState(() {
//         watchList = watchListData.map((movie) {
//           return MoviesDetailsModel.fromJson(movie as Map<String, dynamic>);
//         }).toList();
//       });
//     } catch (e) {
//       print("❌ خطأ أثناء جلب قائمة المشاهدة: $e");
//     }
//   }
//
//   /// 🔴 حذف فيلم من `watch_list`
//   Future<void> removeFromWatchList(String movieId) async {
//     try {
//       DocumentReference userDocRef =
//       _firestore.collection('users').doc(currentUser.email);
//
//       DocumentSnapshot userDoc = await userDocRef.get();
//
//       if (!userDoc.exists) {
//         print("❌ المستخدم غير موجود!");
//         return;
//       }
//
//       List<dynamic> watchListData = List.from(userDoc['watch_list'] ?? []);
//       watchListData.removeWhere((movie) => movie['name'] == movieId);
//
//       await userDocRef.update({'watch_list': watchListData});
//
//       setState(() {
//         watchList.removeWhere((movie) => movie.name == movieId);
//       });
//
//       print("✅ تم حذف الفيلم بنجاح!");
//     } catch (e) {
//       print("❌ خطأ أثناء حذف الفيلم: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var lang = S.of(context);
//
//     return ScaffoldF(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xFF2E1371),
//         title: Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
//           child: HeadAppBar(
//             title: lang.watchlist,
//           ),
//         ),
//       ),
//       body: watchList.isEmpty
//           ? Center(
//         child: Text(
//           lang.sorryNoWatchListMoviesYet,
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       )
//           : SingleChildScrollView(
//         child: Column(
//           children: List.generate(
//             watchList.length,
//                 (index) {
//               final movie = watchList[index];
//               return Column(
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       navigateTo(context: context, screen: MovieDetails(model: MoviesDetailsModel(
//                         trailer: movie.trailer,
//                         releaseDate: movie.releaseDate,
//                         rating: movie.rating,
//                         posterImage: movie.posterImage,
//                         language: movie.language,
//                         duration: movie.duration,
//                         description: movie.description,
//                         crew: movie.crew,
//                         category: movie.category,
//                         cast: movie.cast,
//                         castImages: movie.castImages,
//                         ageRating: movie.ageRating,
//                         name: movie.name
//                       )));
//                     },
//                     child: WatchListPart(
//                       image: movie.posterImage ?? 'assets/images/img_1.png',
//                       title: movie.name ?? "",
//                       time: '${movie.releaseDate} | ${movie.duration}',
//                       smallimage: 'assets/images/star.png',
//                       smalltitle: "${movie.rating}",
//                       onRemove: () async {
//                         await removeFromWatchList(movie.name??"");
//                       },
//                     ),
//                   ),
//                   Image.asset('assets/images/line.png'),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../movie_details/presentation/views/movie_details.dart';
import '../cubit/watch_list_cubit.dart';
import '../cubit/watch_list_state.dart';
import '../widgets/watch_list_part.dart';

class WatchList extends StatefulWidget {
  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {

  @override
  void initState() {
    WatchListCubit.get(context).fetchWatchList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);

    return ScaffoldF(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
          child: HeadAppBar(
            title: lang.watchlist,
          ),
        ),
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          AppLogs.scussessLog(state.toString());

          if (state is WatchListLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.red,));
          } else if (state is WatchListLoaded) {
            AppLogs.scussessLog("loaded");
            return state.watchList.isEmpty
                ? Center(
              child: Text(
                lang.sorryNoWatchListMoviesYet,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
                : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state.watchList.length,
                      (index) {
                    final movie = state.watchList[index];
                    AppLogs.errorLog("SSSSSSSSS");
                    print(state.watchList);
                    AppLogs.scussessLog("SSSSSSSSS");
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(
                              context: context,
                              screen: MovieDetails(
                                model: MoviesDetailsModel(
                                  trailer: movie.trailer,
                                  releaseDate: movie.releaseDate,
                                  rating: movie.rating,
                                  posterImage: movie.posterImage,
                                  language: movie.language,
                                  duration: movie.duration,
                                  description: movie.description,
                                  crew: movie.crew,
                                  category: movie.category,
                                  cast: movie.cast,
                                  castImages: movie.castImages,
                                  ageRating: movie.ageRating,
                                  name: movie.name,
                                ),
                              ),
                            );
                          },
                          child: WatchListPart(
                            image: movie.posterImage ?? 'assets/images/img_1.png',
                            title: movie.name ?? "",
                            time: '${movie.releaseDate} | ${movie.duration}',
                            smallimage: 'assets/images/star.png',
                            smalltitle: "${movie.rating}",
                            onRemove: () async {
                              context.read<WatchListCubit>().removeFromWatchList(movie.name ?? "");
                            },
                          ),
                        ),
                        Image.asset('assets/images/line.png'),
                      ],
                    );
                  },
                ),
              ),
            );
          } else if (state is WatchListError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
