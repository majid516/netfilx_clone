
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/top_rated.dart';



// ignore: must_be_immutable
class EveryOnesWatching extends StatefulWidget {
   EveryOnesWatching({
   required this.index,
    super.key,
  });
  int index;
  @override
  State<EveryOnesWatching> createState() => _EveryOnesWatchingState();
}

class _EveryOnesWatchingState extends State<EveryOnesWatching> {
  late Future<TopRated?> comingSoon;
  final ApiServiceHome apiServiceNewHot = ApiServiceHome();

  @override
  void initState() {
    comingSoon = apiServiceNewHot.getTopRatedMovies();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: comingSoon,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Placeholder while loading
          return SizedBox(
            width: ScreenSize.widthMed,
            height: ScreenSize.heightMed * 0.42,
            child: Center(
              child: Container(
                width: ScreenSize.widthMed * 0.8,
                height: ScreenSize.heightMed * 0.22,
                color: Colors.grey[800],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return spaceHeight10;
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          return Text('No data available');
        }

        final data = snapshot.data!.results;
        var movie = data[widget.index + 8];

        return SizedBox(
          width: ScreenSize.widthMed,
          height: ScreenSize.heightMed * 0.48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster Image with Play Button
              Container(
                width: ScreenSize.widthMed ,
                height: ScreenSize.heightMed * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl + movie.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              
              // Title and Action Icons
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movie.originalName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.telegram,
                          color: Colors.white,
                        ),
                      ),
                      Text('share',style: TextStyle(fontSize: 15,color: whiteColor))
                    ],
                  ),
                  spaceWidth5,
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Text('My List',style: TextStyle(fontSize: 15,color: whiteColor),)
                    ],
                  ),
                  spaceWidth5,
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Text('play',style: TextStyle(fontSize: 15,color: whiteColor))
                    ],
                  ),
                ],
              ),
              
              // Release Date and Description
              
              SizedBox(height: 4),
              Text(
                movie.overview,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}

