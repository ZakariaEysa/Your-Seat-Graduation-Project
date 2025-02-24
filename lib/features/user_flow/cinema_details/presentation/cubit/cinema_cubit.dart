import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../utils/dialog_utilits.dart';
import '../../../../../utils/navigation.dart';
import '../../../auth/presentation/views/sign_in.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import 'cinema_state.dart';

class CinemaCubit extends Cubit<CinemaState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController commentController = TextEditingController();
  var currentUser;

  Map<String, dynamic> cinemaDataMap = {};
  List<MoviesDetailsModel> moviesList = [];
  List<Map<String, dynamic>> commentsList = [];
  List<MoviesDetailsModel> moviesDataList = [];
  List<Map<String, dynamic>> allComments = []; // ✅ جميع التعليقات المحملة

  CinemaCubit() : super(CinemaInitial());

  static CinemaCubit get(BuildContext context) =>
      BlocProvider.of<CinemaCubit>(context);

  /// Getter to access the commentController from outside
  TextEditingController get getCommentController => commentController;

  /// **🔹 جلب بيانات السينما + الأفلام**
  Future<void> fetchCinemaDetails(String cinemaId) async {
    try {
      emit(CinemaLoading());

      // جلب بيانات السينما
      DocumentSnapshot snapshot =
          await _firestore.collection('Cinemas').doc(cinemaId).get();

      if (snapshot.exists) {
        Map<String, dynamic> cinemaData =
            snapshot.data() as Map<String, dynamic>;

        // 🔹 جلب الأفلام الخاصة بالسينما
        List<MoviesDetailsModel> movies = await fetchMoviesByCinema(cinemaId);

        print("✅ عدد الأفلام المسترجعة: ${movies.length}");

        cinemaDataMap = cinemaData;
        moviesList = movies;

        emit(
            CinemaLoaded(cinemaData: cinemaData, comments: [], movies: movies));
      } else {
        emit(CinemaError("No cinema details found"));
      }
    } catch (e) {
      emit(CinemaError("Error fetching cinema details: $e"));
    }
  }

  /// **🔹 جلب الأفلام الخاصة بالسينما**
  Future<List<MoviesDetailsModel>> fetchMoviesByCinema(String cinemaId) async {
    try {
      emit(CinemaMoviesLoading()); // ✅ إطلاق حالة التحميل

      final snapshot =
          await _firestore.collection('Cinemas').doc(cinemaId).get();

      if (snapshot.exists) {
        var cinemaData = snapshot.data();
        var movies = cinemaData?['movies'] as List? ?? [];

        List<MoviesDetailsModel> moviesList = movies
            .map((movie) =>
                MoviesDetailsModel.fromJson(movie as Map<String, dynamic>))
            .toList();

        print("🎬 الأفلام المسترجعة: ${moviesList.length}");

        moviesDataList = moviesList;
        emit(CinemaMoviesLoaded(moviesList)); // ✅ إرسال البيانات بعد التحميل

        return moviesList;
      } else {
        emit(CinemaMoviesError("No movies found"));
        return [];
      }
    } catch (e) {
      print("❌ Error fetching movies: $e");
      emit(CinemaMoviesError("Error fetching movies: $e"));
      return [];
    }
  }


  Future<void> fetchCinemaComments(String cinemaId) async {
    try {
      AppLogs.debugLog("Fetching comments for cinema: $cinemaId");
      emit(CinemaCommentsLoading());

      final snapshot = await _firestore
          .collection('Cinemas')
          .doc(cinemaId)
          .collection('comments')
          .orderBy('timestamp', descending: true)
          .get();

      allComments = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      AppLogs.debugLog("Fetched ${allComments.length} comments");

      // ✅ تحميل أول 5 تعليقات فقط
      commentsList = allComments.take(5).toList();

      emit(CinemaCommentsLoaded(commentsList));
    } catch (e) {
      AppLogs.debugLog("Error fetching comments: $e");
      emit(CinemaCommentsError("Error fetching comments: $e"));
    }
  }

  /// ✅ **تحميل المزيد من التعليقات عند الضغط على "Show More"**
  void loadMoreComments() {
    final currentLength = commentsList.length;
    final remainingComments = allComments.length - currentLength;

    if (remainingComments > 0) {
      final nextBatch = allComments.skip(currentLength).take(5).toList();
      commentsList.addAll(nextBatch);
      emit(CinemaCommentsLoaded(commentsList));
    }
  }

  /// ✅ **إضافة تعليق جديد وتحديث القائمة بعد الإضافة**
  Future<void> addComment(
      String cinemaId,
      BuildContext context,
      String signInText,
      String cancelText,
      TextEditingController getCommentController) async {
    if (HiveStorage.get(HiveKeys.role) == Role.guest.toString()) {
      DialogUtils.showMessage(
        context,
        "You Have To Sign In To Continue",
        isCancelable: false,
        posActionTitle: signInText,
        negActionTitle: cancelText,
        posAction: () {
          HiveStorage.set(HiveKeys.role, "");
          navigateAndRemoveUntil(context: context, screen: const SignIn());
        },
        negAction: () => navigatePop(context: context),
      );
    } else {
      currentUser = HiveStorage.get(HiveKeys.role) == Role.google.toString()
          ? HiveStorage.getGoogleUser()
          : HiveStorage.getDefaultUser();

      if (commentController.text.isNotEmpty) {
        await _firestore
            .collection('Cinemas')
            .doc(cinemaId)
            .collection('comments')
            .add({
          'text': commentController.text,
          'timestamp': FieldValue.serverTimestamp(),
          'userName': currentUser.name,
          'image': currentUser.image,
        });

        commentController.clear();

        /// ✅ تحديث التعليقات تلقائيًا بعد الإضافة
        await fetchCinemaComments(cinemaId);
      }
    }
  }
}
