import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/downloads/model/trending_movie_model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  // Future<TrendingMovies> getTrendingMovies()async{
  //    endPoint = 'movie/upcoming';
  //    final url = '$baseUrl$endPoint$key';
  //    final response = await http.get(Uri.parse(url));
  //    if (response.statusCode == 200) {
  //     log(response.body);
  //      return TrendingMovies.fromJson(jsonDecode(response.body));
  //    }
  //    throw Exception('failed to get trending movies');
  // // }
  Future<TrendingMovies> getTrendingMovies() async {
  const endPoint = 'movie/upcoming';
  final url = '$baseUrl$endPoint$key';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log(response.body);
      return TrendingMovies.fromJson(jsonDecode(response.body));
    } else {
      // Handle HTTP errors
      log('Error: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load trending movies. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network errors or JSON parsing errors
    log('Error: $e');
    throw Exception('Failed to load trending movies: $e');
  }
}
}