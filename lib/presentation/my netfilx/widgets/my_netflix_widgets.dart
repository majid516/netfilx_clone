import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone_app/presentation/my%20netfilx/widgets/liked_movies.dart';

class MyNetflixWidgets extends StatelessWidget {
  const MyNetflixWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.heightMed * 0.1,
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSRcxSFQ4_p7r7NTsGIxRI7iyzFm_-pwHYLQHMvHi22sy8Dw8cz')),
                  color: greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
            ),
            spaceHeight10,
            const Wrap(
              children: [
                Text(
                  'Thing',
                  style: normalTextStyle5,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: whiteColor,
                  size: 30,
                )
              ],
            ),
            spaceHeight10,
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red[900],
                    ),
                    const Positioned(
                        left: 10,
                        top: 8,
                        child: Icon(
                          Icons.notifications,
                          color: whiteColor,
                          size: 40,
                        ))
                  ],
                ),
                spaceWidth10,
                const Text(
                  'Notifications',
                  style: normalTextStyle5,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: whiteColor,
                )
              ],
            ),
            spaceHeight20,
            InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (ctx) => const ScreenDownloads()));
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent[700],
                      ),
                      const Positioned(
                          left: 10,
                          top: 8,
                          child: Icon(
                            Icons.download_sharp,
                            color: whiteColor,
                            size: 40,
                          ))
                    ],
                  ),
                  spaceWidth10,
                  const Text(
                    'Downloads',
                    style: normalTextStyle5,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: whiteColor,
                  ),
                ],
              ),
            ),
            spaceHeight30,
            SizedBox(
              height: ScreenSize.heightMed * 0.34,
              child: const LikedMoviesTileList(
                title: 'TV shows & Mocies You have Liked',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
