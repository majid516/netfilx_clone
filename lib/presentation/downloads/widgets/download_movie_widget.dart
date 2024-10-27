
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/downloads/api_service.dart';
import 'package:netflix_clone_app/infrastructure/downloads/model/trending_movie_model.dart';
import 'package:netflix_clone_app/presentation/downloads/widgets/centeral_wiget.dart';
import 'package:netflix_clone_app/presentation/downloads/widgets/rotated_widget.dart';

class DownloadedMovieWidget extends StatefulWidget {
  const DownloadedMovieWidget({super.key});

  @override
  State<DownloadedMovieWidget> createState() => _DownloadedMovieWidgetState();
}

class _DownloadedMovieWidgetState extends State<DownloadedMovieWidget> {
  late Future<TrendingMovies> future;
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    future = apiService.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}',style:const TextStyle(color: whiteColor),));
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No movies available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        var data = snapshot.data!.results;

          return SizedBox(
            width: ScreenSize.widthMed,
            height: ScreenSize.widthMed * 0.8,
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: ScreenSize.widthMed * 0.37,
                      backgroundColor: whiteColor.withOpacity(0.2),
                    ),
                  ),
                  buildRotatedImageContainer(
                    right: 60,
                    top: 60,
                    angle: 20,
                    imageUrl: '$imageUrl${data[0].posterPath}',
                  ),
                  buildRotatedImageContainer(
                    left: 60,
                    top: 60,
                    angle: -20,
                    imageUrl: '$imageUrl${data[1].posterPath}',
                  ),
                  buildCenterImageContainer('$imageUrl${data[3].posterPath}'),
                ],
              ),
            ),
          );
        });
  }
}