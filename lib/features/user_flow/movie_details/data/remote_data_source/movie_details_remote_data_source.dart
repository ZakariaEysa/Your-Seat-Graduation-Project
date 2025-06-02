import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yourseatgraduationproject/core/Network/end_points.dart';
import '../../../../../core/Network/api_service.dart';
import '../../../../../utils/app_logs.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<List> getCinemas(String movieName);
  Future<String> getRate(String movieId);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  MovieDetailsRemoteDataSourceImpl();

  @override
  Future<List> getCinemas(String movieName) async {
    List<String> cinemaNames = [];
    try {
      // Reference to the cinemas collection
      CollectionReference cinemasCollection =
          FirebaseFirestore.instance.collection('Cinemas');

      // Get all cinemas
      QuerySnapshot cinemasSnapshot = await cinemasCollection.get();

      for (var doc in cinemasSnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<dynamic> movies = data['movies'] ?? [];
        for (var mov in movies) {
          if (mov["name"] == movieName) {
            cinemaNames.add(
                data['name']); // Assuming 'name' is the cinema's name field
          }
        }
      }
    } catch (e) {
      print('Error fetching cinemas: $e');
    }

    AppLogs.infoLog(cinemaNames.length.toString());
    AppLogs.infoLog(cinemaNames.toString());

    return cinemaNames;
  }

  @override
  Future<String> getRate(String movieId) async {
    try {
      AppLogs.infoLog(EndPoints.rate_endpoint + movieId);

      ApiService apiService = ApiService(dio: Dio());
      var result = await apiService.getWithoutToken(
          endPoint: EndPoints.rate_endpoint + movieId);
      String rate = "0";
      if (result.data["Response"] == "True") {
        rate = result.data["Ratings"][0]["Value"].toString();
      }
      AppLogs.infoLog(rate);

      return rate;
    } catch (e) {
      throw Exception('Error during getRate: $e');
    }
  }
}
