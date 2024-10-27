import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/game/widgets/app_bar.dart';
import 'package:netflix_clone_app/presentation/game/widgets/game_list_sec.dart';
import 'package:netflix_clone_app/presentation/game/widgets/game_main_card.dart';

class ScreenGame extends StatefulWidget {
  const ScreenGame({super.key});

  @override
  State<ScreenGame> createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
  bool _isAppBarVisible = true;

  void _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      setState(() {
        _isAppBarVisible = notification.metrics.pixels <= 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          _onScrollNotification(notification);
          return true;
        },
        child: Stack(
          children: [
          const  SingleChildScrollView(
              child: Column(
                children: [
                  GameMainCardWidget(),
                  GameTileSection1(title: 'Top Rated Games', startIndex: 0),
                  GameTileSection1(title: 'Physics-based Games', startIndex: 12),
                ],
              ),
            ),
            if (_isAppBarVisible)const GameAppbarWidget(),
          ],
        ),
      ),
    );
  }
}


// class GameMainCardWidget extends StatefulWidget {
//   const GameMainCardWidget({
//     super.key,
//   });

//   @override
//   State<GameMainCardWidget> createState() => _GameMainCardWidgetState();
// }

// class _GameMainCardWidgetState extends State<GameMainCardWidget> {
//   late Future<List<GameModel>> games;
//   ApiServicesGame apiServicesGame = ApiServicesGame();

//   @override
//   void initState() {
//     games = apiServicesGame.getgames();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: ScreenSize.heightMed * 0.1,
//         ),
//         FutureBuilder<List<GameModel>>(
//           future: games,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error loading games');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Text('No games available');
//             }

//             return SizedBox(
//               height: ScreenSize.heightMed * 0.55,
//               child: ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   var game = snapshot.data![index];
//                   return Container(
//                     width: ScreenSize.widthMed,
//                     height: ScreenSize.heightMed * 0.55,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(game.thumbnail),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     child: Text(
//                       game.title,
//                       style: mainHeadingTextStyle,
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }




// class GameTileSection1 extends StatefulWidget {
//   const GameTileSection1({
//     required this.title,
//     super.key,
//   });
//   final String title;

//   @override
//   State<GameTileSection1> createState() => _GameTileSection1State();
// }

// class _GameTileSection1State extends State<GameTileSection1> {
//   late Future<List<GameModel>> games;
//   ApiServicesGame apiServicesGame = ApiServicesGame();
//    @override
//   void initState() {
//     games = apiServicesGame.getgames();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
    
//     return FutureBuilder(
//       future: games,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error loading games');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Text('No games available');
//             }
//             var data = snapshot.data;
//      return ListView(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           Text(
//             widget.title,
//             style: homeScreenText1,
//           ),
//           spaceHeight10,
//           SizedBox(
//             height: ScreenSize.heightMed * 0.25,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (ctx, index) {
//                 return Container(
//                    width: ScreenSize.widthMed * 0.38,
//                    // color: whiteColor,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                            width: ScreenSize.widthMed * 1,
//                            height: ScreenSize.widthMed * 0.3,
                      
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(12),
//                             image: DecorationImage(image: NetworkImage(data![index+12].thumbnail),fit: BoxFit.fill)),
//                           ),
//                           Text(data[index+12].title,overflow: TextOverflow.ellipsis,maxLines: 2,style: gameTileTextStyle1,),
//                           Text('choice your story',overflow: TextOverflow.ellipsis,maxLines: 1,style: gameTileTextStyle2,),
//                         ],
//                       ),
//                     ),
                  
//                 );
//               },
//               separatorBuilder: (ctx, index) => spaceWidth10,
//               itemCount: 8,
//             ),
//           )
//         ],
//       );},
//     );
//   }
// }


