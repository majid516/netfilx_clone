import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/widgets/app_bar.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/widgets/comin_soons.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/widgets/everyones_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: ScreenSize.heightMed * 0.16,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // First Tab: Coming Soon
                        ListView.builder(
                          itemBuilder: (ctx, index) {
                            return ComingSoonTile(index: index);
                          },
                          itemCount: 6,
                        ),
                        // Second Tab: Everyone's Watching
                        ListView.builder(
                          itemBuilder: (ctx, index) {
                            return EveryOnesWatching(index: index);
                          },
                          itemCount: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  const HotAndNewAppbarWidget(),
                  TabBar(
                    isScrollable: true,
                    dividerHeight: 0,
                    unselectedLabelStyle: normalTextStyle1,
                    labelStyle: normalTextStyle2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    tabs: const [
                      Tab(
                        text: '🍿Coming Soon',
                      ),
                      Tab(
                        text: '🔥Everyones Watching',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// class ComingSoonTile extends StatefulWidget {
//    ComingSoonTile({
//    required this.index,
//     super.key,
//   });
//   int index;
//   @override
//   State<ComingSoonTile> createState() => _ComingSoonTileState();
// }

// class _ComingSoonTileState extends State<ComingSoonTile> {
//   late Future<NewAndHot> comingSoon;
//   ApiServiceNewHot apiServiceNewHot = ApiServiceNewHot();
//   @override
//   void initState() {
//     comingSoon = apiServiceNewHot.getcomingSoonMovies();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: comingSoon,
//       builder: (context, snapshot) {
        
    
//       if(snapshot.connectionState == ConnectionState.waiting){
//           return CircularProgressIndicator();
//         }
//        else if (snapshot.hasError) {
//           print('snapshot has error');
//           return CircularProgressIndicator();

//         }else if(snapshot.data == null){
//           return Text('result is null');
//         }
//       var data  = snapshot.data!.results;

//   String formatDate(DateTime date) {
//     return DateFormat("MMM").format(date); // Formats as "Jan 15" for example
//   }   return SizedBox(
//         width: ScreenSize.widthMed,
//         height: ScreenSize.heightMed * 0.42,
        
//         child: Row(
//           children: [
//             SizedBox(
//               width: ScreenSize.widthMed * 0.2,
//               height: ScreenSize.heightMed * 0.42,
//               child: Column(
//                 children: [
//                   Text(
//                     formatDate(data[widget.index].releaseDate),
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: whiteColor.withOpacity(0.6)),
//                   ),
//                   Text('${data[widget.index].releaseDate.day}',
//                       style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.w700,
//                           color: whiteColor)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: ScreenSize.widthMed * 0.8,
//               height: ScreenSize.heightMed * 0.42,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: ScreenSize.widthMed * 0.8,
//                     height: ScreenSize.heightMed * 0.22,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(imageUrl+data[widget.index].posterPath),
//                             fit: BoxFit.cover),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: CircleAvatar(
//                             radius: 40,
//                             backgroundColor:
//                                 blackColor.withOpacity(0.4),
//                           ),
//                         ),
//                         Center(
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.play_arrow_rounded,
//                                 color: whiteColor,
//                                 size: 70,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         data[widget.index].title,overflow: TextOverflow.ellipsis,maxLines: 1,
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: whiteColor,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Spacer(),
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.notifications_none,
//                                 color: whiteColor,
//                               )),
//                               Text('Read Me',style: gameTileTextStyle2,)
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.info_outline_rounded,
//                                 color: whiteColor,
//                               )),
//                               Text('Info',style: gameTileTextStyle2,)
//                         ],
//                       ),
//                     ],
//                   ),
//                   Text('Coming on 15 November',style: normalTextStyle3,),
//                   Text('A brides romantic night takes a terridiying turn when her wealtjy and eccentric in laws force her to play a gruesome game of hide and seek',style: normalTextStyle4,maxLines: 3,overflow:TextOverflow.ellipsis,)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//       },
//     );
//   }
// }