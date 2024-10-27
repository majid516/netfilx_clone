import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/new_and_hot/model/new_and_hot.dart';
import 'package:http/http.dart' as http;
class ApiServiceNewHot {
  // Future<NewAndHot> getcomingSoonMovies()async{
  //   endPoint =  "movie/upcoming";
  //   final url = '$baseUrl$endPoint$key';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode ==200) {
  //     log(response.body);
  //     return NewAndHot.fromJson(jsonDecode(response.body));
  //   }
  //   throw Exception('top searches movies is thowed exception');
  // }
  Future<NewAndHot> getComingSoonMovies() async {
  try {
    endPoint = "movie/upcoming";
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Response: ${response.body}');
      return NewAndHot.fromJson(jsonDecode(response.body));
    } else {
      log('Failed to load movies: ${response.statusCode}');
      throw Exception('Failed to fetch upcoming movies');
    }
  } on SocketException {
    log('No Internet connection');
    throw Exception('No Internet connection');
  } on FormatException {
    log('Bad response format');
    throw Exception('Bad response format');
  } on HttpException {
    log('Could not find the movies');
    throw Exception('Could not find the movies');
  } catch (e) {
    log('Unexpected error: $e');
    throw Exception('Unexpected error occurred');
  }
}

}