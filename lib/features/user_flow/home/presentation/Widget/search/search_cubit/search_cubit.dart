import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> fetchData(String searchTerm) async {
    if (searchTerm.trim().isEmpty) {
      emit(SearchSuccess([])); // ✅ إذا كان البحث فارغًا، إرجاع قائمة فارغة
      return;
    }

    emit(SearchLoading());

    try {
      List<Map<String, dynamic>> results = await searchInCollections(searchTerm);
      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchError('Something went wrong $e'));
    }
  }

  Future<List<Map<String, dynamic>>> searchInCollections(String searchTerm) async {
    final db = FirebaseFirestore.instance;
    Set<String> seenIds = {};
    List<Map<String, dynamic>> results = [];

    if (searchTerm.isEmpty) return results;

    try {
      String lowerCaseSearchTerm = searchTerm.toLowerCase();
      bool isSingleLetter = lowerCaseSearchTerm.length == 1;

      // ✅ البحث في الأفلام
      QuerySnapshot moviesSnapshot = await db.collection('Movies').get();
      for (var doc in moviesSnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        String movieName = data['name']?.toString().toLowerCase() ?? '';
        List<dynamic> castList = data['cast'] ?? [];

        bool movieMatches = isSingleLetter
            ? movieName.startsWith(lowerCaseSearchTerm)
            : movieName.contains(lowerCaseSearchTerm);

        bool actorMatches = !isSingleLetter &&
            castList.any((actor) => actor.toString().toLowerCase() == lowerCaseSearchTerm);

        if ((movieMatches || actorMatches) && !seenIds.contains(doc.id)) {
          seenIds.add(doc.id);
          results.add({'id': doc.id, ...data});
        }
      }

      // ✅ البحث في السينمات
      QuerySnapshot cinemasSnapshot = await db.collection('Cinemas').get();
      for (var doc in cinemasSnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        String cinemaName = data['name']?.toString().toLowerCase() ?? '';
        if (cinemaName.startsWith(lowerCaseSearchTerm) && !seenIds.contains(doc.id)) {
          seenIds.add(doc.id);
          results.add({'id': doc.id, ...data});
        }
      }
    } catch (e) {
      print('❌ Error searching: $e');
    }

    return results;
  }
}
