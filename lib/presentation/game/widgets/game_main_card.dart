import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/infrastructure/game/api_services.dart';
import 'package:netflix_clone_app/infrastructure/game/model/game_model.dart';


class GameMainCardWidget extends StatefulWidget {
  const GameMainCardWidget({super.key});

  @override
  State<GameMainCardWidget> createState() => _GameMainCardWidgetState();
}

class _GameMainCardWidgetState extends State<GameMainCardWidget> {
  late Future<List<GameModel>> games;
  ApiServicesGame apiServicesGame = ApiServicesGame();

  @override
  void initState() {
    games = apiServicesGame.getgames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenSize.heightMed * 0.1),
        FutureBuilder<List<GameModel>>(
          future: games,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: ScreenSize.heightMed * 0.55,
                child: ListView.builder(
                  itemCount: 5, 
                  itemBuilder: (context, index) {
                    return Container(
                      width: ScreenSize.widthMed,
                      height: ScreenSize.heightMed * 0.55,
                      color: Colors.grey.withOpacity(0.3),
                      margin:const EdgeInsets.symmetric(vertical: 8.0),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('Error loading games');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No games available');
            }

            return SizedBox(
              height: ScreenSize.heightMed * 0.55,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var game = snapshot.data![index+12];
                  return Container(
                    width: ScreenSize.widthMed,
                    height: ScreenSize.heightMed * 0.55,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(game.thumbnail),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Text(
                      game.title,
                      style: mainHeadingTextStyle,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
