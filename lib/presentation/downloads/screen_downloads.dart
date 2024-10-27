import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/presentation/downloads/widgets/app_bar.dart';
import 'package:netflix_clone_app/presentation/downloads/widgets/download_movie_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const DownloadsAppbarWidget(),
            const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: whiteColor,
                ),
                spaceWidth10,
                Text(
                  'Smart Downloads',
                  style: normalTextStyle1,
                ),
              ],
            ),
            spaceHeight20,
            const Text(
              'Turn on Downloads for You',
              style: normalTextStyle5,
            ),
            spaceHeight10,
            const Text(
              'We will download movies and shows just for you, so you will always have something to watch.',
              style: normalTextStyle6,
            ),
            spaceHeight25,
            const DownloadedMovieWidget(),
            spaceHeight20,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(ScreenSize.widthMed, 45)),
              child: const Text(
                'Set Up',
                style: buttonTextstyle2,
              ),
            ),
            spaceHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Find More to Download',
                    style: buttonTextstyle2,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
