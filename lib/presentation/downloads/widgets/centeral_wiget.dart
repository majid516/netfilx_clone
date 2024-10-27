import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';

Widget buildCenterImageContainer(String imageUrl) {
    return Center(
      child: Container(
        width: ScreenSize.widthMed * 0.4,
        height: ScreenSize.widthMed * 0.6,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
