import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone_app/infrastructure/game/model/game_model.dart';
import 'package:http/http.dart' as http;
class ApiServicesGame {
  Future<List<GameModel>> getgames() async {
    const url = 'https://www.freetogame.com/api/games';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      log(response.body);
      return jsonData.map((json) => GameModel.fromJson(json)).toList();
    }
    throw Exception('Games API threw an exception');
  }
}
