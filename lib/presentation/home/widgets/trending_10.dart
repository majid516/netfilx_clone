import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/top_rated.dart';
import 'package:stroke_text/stroke_text.dart';


class MovieTileListTop10 extends StatefulWidget {
  const MovieTileListTop10({super.key});

  @override
  State<MovieTileListTop10> createState() => _MovieTileListTop10State();
}

class _MovieTileListTop10State extends State<MovieTileListTop10> {
  late Future<TopRated?> topRated;
  ApiServiceHome apiServiceHome = ApiServiceHome();

  @override
  void initState() {
    topRated = apiServiceHome.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topRated,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {
          // Display grey placeholder containers while loading
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top 10 Movies in India today',
                style: homeScreenText1,
              ),
              spaceHeight10,
              SizedBox(
                height: ScreenSize.heightMed * 0.2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: ScreenSize.widthMed * 0.5,
                      decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => spaceWidth10,
                  itemCount: 10,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          print('snapshot has error');
          return CircularProgressIndicator();
        } else if (snapshot.data == null) {
          return Text('Result is null');
        }

        var data = snapshot.data!.results;
        return ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(
              'Top 10 Movies in India today',
              style: homeScreenText1,
            ),
            spaceHeight10,
            SizedBox(
              height: ScreenSize.heightMed * 0.2,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: ScreenSize.widthMed * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          child: StrokeText(
                            text: '${index + 1}',
                            strokeColor: whiteColor,
                            textColor: blackColor,
                            strokeWidth: 3,
                            textStyle: strokeTextStyle,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.8, 0),
                          child: Container(
                            width: ScreenSize.widthMed * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: greyColor.withOpacity(0.2),
                              image: DecorationImage(
                                image: NetworkImage('$imageUrl${data[index].posterPath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => spaceWidth10,
                itemCount: 10,
              ),
            ),
          ],
        );
      },
    );
  }
}

