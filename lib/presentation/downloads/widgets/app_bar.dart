import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';

class DownloadsAppbarWidget extends StatelessWidget {
  const DownloadsAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenSize.heightMed * 0.09,
      color: blackColor.withOpacity(0.4),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon:const Icon(
                Icons.arrow_back_outlined,
                color: whiteColor,
              )),
         const Text(
            'Downloads',
            style: mainHeadingTextStyle,
          ),
        const  Spacer(),
        const  Icon(
            Icons.search,
            color: whiteColor,
            size: 35,
          ),
          spaceWidth10,
        const  Icon(
            Icons.menu,
            color: whiteColor,
            size: 35,
          ),
        ],
      ),
    );
  }
}
