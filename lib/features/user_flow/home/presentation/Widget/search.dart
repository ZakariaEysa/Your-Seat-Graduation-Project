import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      fetchData();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextFormField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Icon(Icons.search, color: Colors.white70),
              ),
              hintText: lang.search,
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 14.sp,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          searchResults.isEmpty
              ? Center(
            child: Text(
              lang.noResultsFound,
              style: TextStyle(color: Colors.white70),
            ),
          )
              : ListView.builder(
            shrinkWrap: true,
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final result = searchResults[index];
              return ListTile(
                title: Text(
                  result['data']['name'] ?? result['data']['title'] ?? 'Unknown',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  result['collection'],
                  style: const TextStyle(color: Colors.white70),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> fetchData() async {
    String searchTerm = _controller.text.trim();
    if (searchTerm.isEmpty) {
      setState(() => searchResults.clear());
      return;
    }

    List<Map<String, dynamic>> results = await searchInCollections(searchTerm);
    if (mounted) {
      setState(() {
        searchResults = results;
      });
    }
  }

  Future<List<Map<String, dynamic>>> searchInCollections(String searchTerm) async {
    final db = FirebaseFirestore.instance;
    List<Map<String, dynamic>> results = [];

    if (searchTerm.isEmpty) return results;

    try {
      String lowerCaseSearchTerm = searchTerm.toLowerCase();
      String upperCaseSearchTerm = searchTerm.toUpperCase();
      String capitalizedSearchTerm =
          searchTerm[0].toUpperCase() + searchTerm.substring(1).toLowerCase();

      List<QuerySnapshot> moviesSnapshots = await Future.wait([
        db.collection('Movies').where('name', isEqualTo: searchTerm).get(),
        db.collection('Movies').where('name', isEqualTo: lowerCaseSearchTerm).get(),
        db.collection('Movies').where('name', isEqualTo: upperCaseSearchTerm).get(),
        db.collection('Movies').where('name', isEqualTo: capitalizedSearchTerm).get(),
        db.collection('Movies')
            .where('name', isGreaterThanOrEqualTo: lowerCaseSearchTerm)
            .where('name', isLessThan: '$lowerCaseSearchTerm\uf8ff')
            .get(),
        db.collection('Movies')
            .where('name', isGreaterThanOrEqualTo: upperCaseSearchTerm)
            .where('name', isLessThan: '$upperCaseSearchTerm\uf8ff')
            .get(),
      ]);

      for (var snapshot in moviesSnapshots) {
        for (var doc in snapshot.docs) {
          if (!results.any((item) => item['id'] == doc.id)) {
            results.add({'collection': 'movies', 'id': doc.id, 'data': doc.data()});
          }
        }
      }

      List<QuerySnapshot> cinemasSnapshots = await Future.wait([
        db.collection('cinemas').where('name', isEqualTo: searchTerm).get(),
        db.collection('cinemas').where('name', isEqualTo: lowerCaseSearchTerm).get(),
        db.collection('cinemas').where('name', isEqualTo: upperCaseSearchTerm).get(),
        db.collection('cinemas').where('name', isEqualTo: capitalizedSearchTerm).get(),
        db.collection('cinemas')
            .where('name', isGreaterThanOrEqualTo: lowerCaseSearchTerm)
            .where('name', isLessThan: '$lowerCaseSearchTerm\uf8ff')
            .get(),
        db.collection('cinemas')
            .where('name', isGreaterThanOrEqualTo: upperCaseSearchTerm)
            .where('name', isLessThan: '$upperCaseSearchTerm\uf8ff')
            .get(),
      ]);

      for (var snapshot in cinemasSnapshots) {
        for (var doc in snapshot.docs) {
          if (!results.any((item) => item['id'] == doc.id)) {
            results.add({'collection': 'cinemas', 'id': doc.id, 'data': doc.data()});
          }
        }
      }
    } catch (e) {
      print('❌ Error searching: $e');
    }

    return results;
  }

}
