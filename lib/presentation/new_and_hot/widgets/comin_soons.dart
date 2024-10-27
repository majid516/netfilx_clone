import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/new_and_hot/api_service.dart';
import 'package:netflix_clone_app/infrastructure/new_and_hot/model/new_and_hot.dart';

class ComingSoonTile extends StatefulWidget {
  const ComingSoonTile({
    required this.index,
    super.key,
  });
  final int index;

  @override
  State<ComingSoonTile> createState() => _ComingSoonTileState();
}

class _ComingSoonTileState extends State<ComingSoonTile> {
  late Future<NewAndHot> comingSoon;
  final ApiServiceNewHot apiServiceNewHot = ApiServiceNewHot();

  @override
  void initState() {
    comingSoon = apiServiceNewHot.getComingSoonMovies();
    super.initState();
  }

  String formatDate(DateTime date) {
    return DateFormat("MMM").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewAndHot>(
      future: comingSoon,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
          return const Text('No data available');
        }

        final data = snapshot.data!.results;
        final movie = data[widget.index];

        return SizedBox(
          width: ScreenSize.widthMed,
          height: ScreenSize.heightMed * 0.42,
          child: Row(
            children: [
              SizedBox(
                width: ScreenSize.widthMed * 0.2,
                height: ScreenSize.heightMed * 0.42,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formatDate(movie.releaseDate),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      '${movie.releaseDate.day}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenSize.widthMed * 0.8,
                height: ScreenSize.heightMed * 0.42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ScreenSize.widthMed * 0.8,
                      height: ScreenSize.heightMed * 0.22,
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
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Coming on ${movie.releaseDate.day} ${formatDate(movie.releaseDate)}',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
