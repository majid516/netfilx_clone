import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/home/api_service.dart';
import 'package:netflix_clone_app/infrastructure/home/model/top_rated.dart';

class LikedMoviesTileList extends StatefulWidget {
  const LikedMoviesTileList({
    required this.title,
    super.key,
  });
  final String title;

  @override
  State<LikedMoviesTileList> createState() => _LikedMoviesTileListState();
}

class _LikedMoviesTileListState extends State<LikedMoviesTileList> {
  late Future<TopRated?> liked;
  ApiServiceHome api = ApiServiceHome();

  @override
  void initState() {
    liked = api.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: liked,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError) {
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
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          return const Text('No data available');
        }

        final data = snapshot.data;
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(
              widget.title,
              style: normalTextStyle3,
              overflow: TextOverflow.ellipsis,
            ),
            spaceHeight20,
            SizedBox(
              height: ScreenSize.heightMed * 0.3,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return SizedBox(
                    width: ScreenSize.widthMed * 0.32,
                    child: Column(
                      children: [
                        Container(
                          width: ScreenSize.widthMed * 0.32,
                          height: ScreenSize.heightMed * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl +
                                      data!.results[index].posterPath),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          width: ScreenSize.widthMed * 0.35,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            color: whiteColor.withOpacity(0.12),
                          ),
                          child: const Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: whiteColor,
                                size: 30,
                              ),
                              Text(
                                'share',
                                style: normalTextStyle1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => spaceWidth10,
                itemCount: 8,
              ),
            )
          ],
        );
      },
    );
  }
}
