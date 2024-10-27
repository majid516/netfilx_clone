import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/upcoming.dart';

class UpcomingMovieList extends StatefulWidget {
  const UpcomingMovieList({
    required this.title,
    super.key,
  });
  final String title;

  @override
  State<UpcomingMovieList> createState() => _UpcomingMovieListState();
}

class _UpcomingMovieListState extends State<UpcomingMovieList> {
  late Future<UpcomingMovies?> upcoming;
  ApiServiceHome apiServiceHome = ApiServiceHome();

  @override
  void initState() {
    upcoming = apiServiceHome.getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcoming,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && snapshot.hasError) {
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
                  itemCount: 12, 
                ),
              ),
            ],
          );
        
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          return Text('No data available');
        }
        final data = snapshot.data!.results;
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
                      color: greyColor.withOpacity(0.2),
                      image: DecorationImage(
                        image: NetworkImage('$imageUrl${data[index].posterPath}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => spaceWidth10,
                itemCount: 12, // Only show 12 items
              ),
            ),
          ],
        );
      },
    );
  }
}
