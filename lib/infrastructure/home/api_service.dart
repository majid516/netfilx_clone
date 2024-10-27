import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/model/popular_movie.dart';
import 'package:netflix_clone_app/infrastructure/home/model/top_rated.dart';
import 'package:http/http.dart'as http;
import 'package:netflix_clone_app/infrastructure/home/model/tv_shows.dart';
import 'package:netflix_clone_app/infrastructure/home/model/upcoming.dart';
class ApiServiceHome {
  // Future<TopRated> getTopRatedMovies()async{
  //   endPoint = 'tv/top_rated';
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //    // log(response.body);
  //     return TopRated.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('top rated movies is thowed exception');
  // }
  // Future<PopularMovies> getPopularMovies()async{
  //   endPoint =  "movie/popular";
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //    // log(response.body);
  //     return PopularMovies.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('popular movies is thowed exception');
  // }
  //   Future<TvShows> getTvShow()async{
  //   endPoint =  "discover/tv";
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //   //  log(response.body);
  //     return TvShows.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('Tv shows is thowed exception');
  // }
  //  Future<UpcomingMovies> getUpcomingMovies()async{
  //   endPoint =  "movie/upcoming";
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //     log(response.body);
  //     return UpcomingMovies.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('Upcoming movies is thowed exception');
  // }



Future<TopRated?> getTopRatedMovies() async {
  try {
    const endPoint = 'tv/top_rated';
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return TopRated.fromJson(jsonDecode(response.body));
    } else {
      log('Error: Server returned status code ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    log('Network error in getTopRatedMovies: $e');
  } on FormatException catch (e) {
    log('JSON format error in getTopRatedMovies: $e');
  } on Exception catch (e) {
    log('Unexpected error in getTopRatedMovies: $e');
  }
  return null;
}

Future<PopularMovies?> getPopularMovies() async {
  try {
    const endPoint = "movie/popular";
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      log('Error: Server returned status code ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    log('Network error in getPopularMovies: $e');
  } on FormatException catch (e) {
    log('JSON format error in getPopularMovies: $e');
  } on Exception catch (e) {
    log('Unexpected error in getPopularMovies: $e');
  }
  return null;
}

Future<TvShows?> getTvShow() async {
  try {
    const endPoint = "discover/tv";
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return TvShows.fromJson(jsonDecode(response.body));
    } else {
      log('Error: Server returned status code ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    log('Network error in getTvShow: $e');
  } on FormatException catch (e) {
    log('JSON format error in getTvShow: $e');
  } on Exception catch (e) {
    log('Unexpected error in getTvShow: $e');
  }
  return null;
}


Future<UpcomingMovies?> getUpcomingMovies() async {
  try {
    const endPoint = "movie/upcoming";
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log(response.body);
      return UpcomingMovies.fromJson(jsonDecode(response.body));
    } else {
      log('Error: Server returned status code ${response.statusCode}');
      return null; 
    }
  } on http.ClientException catch (e) {
    log('Network error: $e');
  } on FormatException catch (e) {
    log('JSON format error: $e');
  } on Exception catch (e) {
    log('Unexpected error: $e');
  }
  return null;
}

}