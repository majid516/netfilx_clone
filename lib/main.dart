import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const NetflixClone());
}

class NetflixClone extends StatelessWidget {
  const NetflixClone({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenSize.initialize(context);
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundThemeColor,
      ),
      home: ScreenMainPage(),
    );
  }
}
