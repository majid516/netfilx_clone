import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/search/api_service.dart';
import 'package:netflix_clone_app/infrastructure/search/model/top_searches.dart';

class TopSearchesSuggesions extends StatefulWidget {
  const TopSearchesSuggesions({
    super.key,
  });

  @override
  State<TopSearchesSuggesions> createState() => _TopSearchesSuggesionsState();
}

class _TopSearchesSuggesionsState extends State<TopSearchesSuggesions> {
  late Future<TopSearchSuggesion> topSearch;
  ApiServiceSearch apiServiceSearch = ApiServiceSearch();

  @override
  void initState() {
    topSearch = apiServiceSearch.getTopSearchesMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: topSearch,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log('snapshot has error');
            return const Center(
                child: Text(
              'loading...',
              style: noResultStyle,
            ));
          } else if (snapshot.data == null || snapshot.data!.results.isEmpty) {
            return const Center(child: Text('loading', style: noResultStyle));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!.results;
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: ScreenSize.widthMed,
                  height: ScreenSize.widthMed * 0.25,
                  decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        height: ScreenSize.widthMed * 0.25,
                        width: ScreenSize.widthMed * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    imageUrl + data[index + 3].posterPath),
                                fit: BoxFit.fill)),
                      ),
                      spaceWidth10,
                      Text(
                        data[index].title,
                        style: normalTextStyle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 12,
          );
        });
  }
}
