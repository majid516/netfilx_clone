import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';

class MyNetflixAppbarWidget extends StatelessWidget {
  const MyNetflixAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenSize.heightMed * 0.09,
      color: blackColor.withOpacity(0.4),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(
              'My Netlix',
              style: mainHeadingTextStyle,
            ),
            Spacer(),
            Icon(
              Icons.search,
              color: whiteColor,
              size: 35,
            ),
            spaceWidth10,
            Icon(
              Icons.menu,
              color: whiteColor,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
