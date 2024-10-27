import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/core/constants/screen_size.dart';
import 'package:netflix_clone_app/core/strings/strings.dart';
import 'package:netflix_clone_app/infrastructure/search/api_service.dart';
import 'package:netflix_clone_app/infrastructure/search/model/search_result_model.dart';

class SearchResultGrid extends StatefulWidget {
  const SearchResultGrid({
    required this.searchController,
    super.key,
  });

  final String searchController;

  @override
  State<SearchResultGrid> createState() => _SearchResultGridState();
}

class _SearchResultGridState extends State<SearchResultGrid> {
  late Future<SearchResultModel> searchResult;
  final ApiServiceSearch apiServiceSearch = ApiServiceSearch();

  @override
  void initState() {
    super.initState();
    _fetchSearchResults(widget.searchController);
  }

  @override
  void didUpdateWidget(covariant SearchResultGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchController != widget.searchController) {
      _fetchSearchResults(widget.searchController);
    }
  }

  void _fetchSearchResults(String searchWord) {
    setState(() {
      searchResult = apiServiceSearch.getSearchResults(searchWord);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResultModel>(
        future: searchResult,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log('snapshot has error');
            return const Center(
                child: Text('No results found', style: noResultStyle));
          } else if (snapshot.data == null || snapshot.data!.results.isEmpty) {
            return const Center(
                child: Text(
              'No results found',
              style: noResultStyle,
            ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!.results;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: ScreenSize.widthMed * 0.5,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: data.length,
            itemBuilder: (ctx, index) {
              return Container(
                width: ScreenSize.widthMed * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: greyColor.withOpacity(0.2),
                  image: DecorationImage(
                    image: NetworkImage('$imageUrl${data[index].backdropPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        });
  }
}
