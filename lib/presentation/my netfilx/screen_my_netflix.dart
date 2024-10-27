import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/my%20netfilx/widgets/app_bar.dart';
import 'package:netflix_clone_app/presentation/my%20netfilx/widgets/my_netflix_widgets.dart';

class ScreenMyNetflix extends StatelessWidget {
  const ScreenMyNetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MyNetflixWidgets(),
          MyNetflixAppbarWidget(),
        ],
      ),
    );
  }
}

