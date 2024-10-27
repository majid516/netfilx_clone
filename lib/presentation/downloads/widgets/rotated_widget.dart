 
 import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';

 Widget buildRotatedImageContainer({
    double? left,
    double? right,
    double? top,
    required double angle,
    required String imageUrl,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: ScreenSize.widthMed * 0.4,
          height: ScreenSize.widthMed * 0.55,
          decoration: BoxDecoration(
            color: whiteColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }