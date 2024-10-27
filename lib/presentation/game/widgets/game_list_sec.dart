import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/infrastructure/game/api_services.dart';
import 'package:netflix_clone_app/infrastructure/game/model/game_model.dart';


class GameTileSection1 extends StatefulWidget {
  const GameTileSection1({required this.title,required this.startIndex ,super.key});
  final String title;
   final int startIndex;

  @override
  State<GameTileSection1> createState() => _GameTileSection1State();
}

class _GameTileSection1State extends State<GameTileSection1> {
  late Future<List<GameModel>> games;
  ApiServicesGame apiServicesGame = ApiServicesGame();

  @override
  void initState() {
    games = apiServicesGame.getgames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameModel>>(
      future: games,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(widget.title, style: homeScreenText1),
              spaceHeight10,
              SizedBox(
                height: ScreenSize.heightMed * 0.25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: ScreenSize.widthMed * 0.38,
                      height: ScreenSize.widthMed * 0.3,
                      color: Colors.grey.withOpacity(0.3),
                      margin:const EdgeInsets.symmetric(horizontal: 10.0),
                    );
                  },
                  separatorBuilder: (ctx, index) => spaceWidth10,
                  itemCount: 8, 
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('Error loading games');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No games available');
        }

        var data = snapshot.data;
        return ListView(
          physics:const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(widget.title, style: homeScreenText1),
            spaceHeight10,
            SizedBox(
              height: ScreenSize.heightMed * 0.25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: ScreenSize.widthMed * 0.38,
                    margin:const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ScreenSize.widthMed * 1,
                          height: ScreenSize.widthMed * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(data![widget.startIndex + index ].thumbnail),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          data[widget.startIndex + index ].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: gameTileTextStyle1,
                        ),
                        Text(
                          data[widget.startIndex + index].shortDescription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: gameTileTextStyle2,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => spaceWidth10,
                itemCount: 8,
              ),
            ),
          ],
        );
      },
    );
  }
}
