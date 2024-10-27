import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/search/model/search_result_model.dart';
import 'package:http/http.dart'as http;
import 'package:netflix_clone_app/infrastructure/search/model/top_searches.dart';
class ApiServiceSearch{
  //  Future<SearchResultModel> getSearchResults(String str)async{
  //     endPoint =  "search/movie?query=$str";
  //   final url = '$baseUrl$endPoint$key2';
  //   log(url);
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //   //  log(response.body);
  //     return SearchResultModel.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('search movies is thowed exception');
  //  }
  //  Future<TopSearchSuggesion> getTopSeachesMovies()async{
  //   endPoint =  "movie/top_rated";
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //     log(response.body);
  //     return TopSearchSuggesion.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('top searches movies is thowed exception');
  // }
  Future<SearchResultModel> getSearchResults(String str) async {
  try {
    endPoint = "search/movie?query=$str";
    final url = '$baseUrl$endPoint$key2';
    log('Search URL: $url');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SearchResultModel.fromJson(jsonDecode(response.body));
    } else {
      log('Failed to load search results: ${response.statusCode}');
      throw Exception('Failed to fetch search results');
    }
  } on SocketException {
    log('No Internet connection');
    throw Exception('No Internet connection');
  } on FormatException {
    log('Bad response format');
    throw Exception('Bad response format');
  } on HttpException {
    log('Could not find the search results');
    throw Exception('Could not find the search results');
  } catch (e) {
    log('Unexpected error: $e');
    throw Exception('Unexpected error occurred');
  }
}

Future<TopSearchSuggesion> getTopSearchesMovies() async {
  try {
    endPoint = "movie/top_rated";
    final url = '$baseUrl$endPoint$key';
    log('Top Searches URL: $url');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Response: ${response.body}');
      return TopSearchSuggesion.fromJson(jsonDecode(response.body));
    } else {
      log('Failed to load top searches: ${response.statusCode}');
      throw Exception('Failed to fetch top searches');
    }
  } on SocketException {
    log('No Internet connection');
    throw Exception('No Internet connection');
  } on FormatException {
    log('Bad response format');
    throw Exception('Bad response format');
  } on HttpException {
    log('Could not find the top searches');
    throw Exception('Could not find the top searches');
  } catch (e) {
    log('Unexpected error: $e');
    throw Exception('Unexpected error occurred');
  }
}

}