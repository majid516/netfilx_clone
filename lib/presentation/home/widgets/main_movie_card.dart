import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/top_rated.dart';


class MainMovieCard extends StatefulWidget {
  const MainMovieCard({super.key});

  @override
  State<MainMovieCard> createState() => _MainMovieCardState();
}

class _MainMovieCardState extends State<MainMovieCard> {
  late Future<TopRated?> topRateds;
  ApiServiceHome apiServiceHome = ApiServiceHome();

  @override
  void initState() {
    topRateds = apiServiceHome.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRated?>(
  future: topRateds,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      // Show loading indicator while waiting for the data
      return Column(
        children: [
          SizedBox(
            height: ScreenSize.heightMed * 0.1,
          ),
          Container(
            width: ScreenSize.widthMed * 0.94,
            height: ScreenSize.heightMed * 0.55,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text('Loading...', style: TextStyle(color: Colors.white))),
          ),
        ],
      );
    } else if (snapshot.hasError) {
      // Show error message
      return Text('An error occurred');
    } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
      // Show message if no data is available
      return Text('No data available');
    }

    // If data is available, display the actual movie card
    var data = snapshot.data!.results;
    return Column(
      children: [
        SizedBox(
          height: ScreenSize.heightMed * 0.1,
        ),
        Container(
          width: ScreenSize.widthMed * 0.94,
          height: ScreenSize.heightMed * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: whiteColor.withOpacity(0.3), width: 1.5),
            image: DecorationImage(
              image: NetworkImage(imageUrl + data[12].posterPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: blackColor.withOpacity(0.4),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: whiteColor,
                          size: 70,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(ScreenSize.widthMed * 0.38, 40),
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Wrap(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: blackColor,
                          ),
                          Text(
                            'Play',
                            style: buttonTextstyle1,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(ScreenSize.widthMed * 0.38, 40),
                        backgroundColor: whiteColor.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Wrap(
                        children: [
                          Icon(
                            Icons.add,
                            color: whiteColor,
                          ),
                          Text(
                            'My List',
                            style: buttonTextstyle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  },
);

  }
}
