import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, newValue, _) {
        return BottomNavigationBar(
            selectedItemColor: whiteColor,
            unselectedItemColor: greyColor,
            currentIndex: newValue,
            type: BottomNavigationBarType.fixed,
            backgroundColor: blackColor,
            onTap: (value) {
              indexChangeNotifier.value = value;
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.abc), label: 'game'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.collections_outlined), label: 'new&hot'),
              BottomNavigationBarItem(
                  icon: Container(
                    width: 20,
                    height: 20,
                    //    color: Colors.blue,
                    decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.5),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSRcxSFQ4_p7r7NTsGIxRI7iyzFm_-pwHYLQHMvHi22sy8Dw8cz'))),
                  ),
                  label: 'My Netflix'),
            ]);
      },
    );
  }
}
