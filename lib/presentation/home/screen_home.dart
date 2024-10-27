import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_movie_card.dart';
import 'package:netflix_clone_app/presentation/home/widgets/popular.dart';
import 'package:netflix_clone_app/presentation/home/widgets/trending_10.dart';
import 'package:netflix_clone_app/presentation/home/widgets/tv_shows.dart';
import 'package:netflix_clone_app/presentation/home/widgets/upcoming_list.dart';


class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
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
          children:[
          const  SingleChildScrollView(
              child: Column(
                children: [
                  MainMovieCard(),
                  UpcomingMovieList(title: 'Upcoming Movies'),
                  TrendingMoviesLists(title: 'Trending'),
                  MovieTileListTop10(),
                  TvShowsList(title: 'TV shows'),
                ],
              ),
            ),
            if (_isAppBarVisible)const HomeAppbarWidget(),
          ],
        ),
      ),
    );
  }
}







