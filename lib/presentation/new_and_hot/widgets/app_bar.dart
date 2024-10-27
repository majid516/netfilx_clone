import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';

class HotAndNewAppbarWidget extends StatelessWidget {
  const HotAndNewAppbarWidget({
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
              'New & Hot',
              style: mainHeadingTextStyle,
            ),
            Spacer(),
            Icon(
              Icons.file_download_outlined,
              color: whiteColor,
              size: 35,
            ),
            spaceWidth10,
            Icon(
              Icons.search,
              color: whiteColor,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
