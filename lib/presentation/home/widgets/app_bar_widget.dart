import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone_app/presentation/search/screen_search.dart';



class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenSize.heightMed * 0.09,
      color: blackColor.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3XQTsTTYkFTTSZN-JvG9jhKmuOPIa6rUJhg&s'),
                      fit: BoxFit.fill)),
            ),
            Spacer(),
            
            
            spaceWidth10,
            IconButton(
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => ScreenDownloads()));
            },
             icon: Icon( Icons.file_download_outlined,
              color: whiteColor,
              size: 35,),
            ),
             IconButton(
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => ScreenSearch()));
            },
             icon: Icon( Icons.search,
              color: whiteColor,
              size: 35,),
            ),
          ],
        ),
      ),
    );
  }
}

