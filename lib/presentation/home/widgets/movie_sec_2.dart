import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/popular_movie.dart';


class MovieTileListSection2 extends StatefulWidget {
   MovieTileListSection2({
    super.key,
   required this.title,
  });
  String title;

  @override
  State<MovieTileListSection2> createState() => _MovieTileListSection2State();
}

class _MovieTileListSection2State extends State<MovieTileListSection2> {

   late Future<PopularMovies?> popular;
  ApiServiceHome apiServiceHome = ApiServiceHome();

  @override
  void initState() {
    popular = apiServiceHome.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popular,
       builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Placeholder layout while loading
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: homeScreenText1,
              ),
              spaceHeight10,
              SizedBox(
                height: ScreenSize.heightMed * 0.2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: ScreenSize.widthMed * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: greyColor.withOpacity(0.2), // Placeholder color
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => spaceWidth10,
                  itemCount: 12, // Number of placeholder items
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error loading data', style: TextStyle(color: Colors.red));
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          return Text('No data available');
        }

        // Actual data display once loading is complete
        final data = snapshot.data!.results;
     return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            'Countine watching',
            style: homeScreenText1,
          ),
          spaceHeight10,
          SizedBox(
            height: ScreenSize.heightMed * 0.2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  width: ScreenSize.widthMed * 0.35,
                  //   height: ScreenSize.heightMed * 0.3,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(100),
                              border: Border.all(
                                color: whiteColor,
                                width: 3,
                              ),
                              color: blackColor.withOpacity(0.2)),
                        ),
                        Positioned(
                            left: -10,
                            top: -9,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow_rounded,
                                  color: whiteColor,
                                  size: 60,
                                ))),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.accents[index + 1],
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://www.tallengestore.com/cdn/shop/products/Dora_The_Explorer_And_The_Lost_City_Of_Gold_-_Hollywood_English_Movie_Poster_1_4ed6ce91-1d68-45aa-b9f1-d777f47f5f0a.jpg?v=1577693669'),
                          fit: BoxFit.cover)),
                );
              },
              separatorBuilder: (ctx, index) => spaceWidth10,
              itemCount: 12,
            ),
          )
        ],
      );},
    );
  }
}
