import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constants/constant.dart';
import 'package:netflix_clone_app/presentation/search/widgets/search_result.dart';
import 'package:netflix_clone_app/presentation/search/widgets/search_suggession.dart';

// ignore: must_be_immutable
class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  ValueNotifier<String> search = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                spaceWidth10,
                Text('Search', style: mainHeadingTextStyle),
              ],
            ),
            spaceHeight20,
            SearchBar(
              onChanged: (value) {
                search.value = value;
              },
              hintText: '  Search...',
              textStyle: const WidgetStatePropertyAll(noResultStyle),
              backgroundColor: const WidgetStatePropertyAll(
                Color.fromARGB(40, 255, 255, 255),
              ),
            ),
            spaceHeight10,
            ValueListenableBuilder(
              valueListenable: search,
              builder: (context, value, child) {
                return Expanded(
                  child: value.isEmpty
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spaceWidth10,
                            Row(
                              children: [
                                Text(
                                  'Top Searches',
                                  style: normalTextStyle3,
                                ),
                              ],
                            ),
                            spaceHeight20,
                            Expanded(child: TopSearchesSuggesions()),
                          ],
                        )
                      : SearchResultGrid(searchController: value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
