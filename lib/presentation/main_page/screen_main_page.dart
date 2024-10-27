import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/game/screen_game.dart';
import 'package:netflix_clone_app/presentation/home/screen_home.dart';
import 'package:netflix_clone_app/presentation/main_page/widgets/bottom_nav_bar.dart';
import 'package:netflix_clone_app/presentation/my%20netfilx/screen_my_netflix.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/screen_new_and_hot.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = const[
    ScreenHome(),
    ScreenGame(),
    ScreenNewAndHot(),
    ScreenMyNetflix(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder:(context, index, _) {
          return _pages[index];
        },),
        bottomNavigationBar:const BottomNavBar(),
      ),
    );
  }
}