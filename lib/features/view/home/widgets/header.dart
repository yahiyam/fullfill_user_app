import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/instence.dart';
import '../../../../utils/screen_size.dart';
import '../../search/search_restaurant_page.dart';
import '../functions/meal_categories.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentCategory = getMealCategory();
    final String userName = sharedPreferences!.getString("name")!.toUpperCase();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Screen.height(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // WelcomeMessage
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: black,
                ),
                children: [
                  const TextSpan(text: 'Welcome '),
                  TextSpan(
                    text: userName,
                    style: const TextStyle(color: commonColor),
                  ),
                  const TextSpan(
                    text: '.\nWhat do you want for ',
                    style: TextStyle(color: black),
                  ),
                  TextSpan(
                    text: currentCategory,
                    style: const TextStyle(
                      height: 1.5,
                      color: commonColor,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // SearchTextField,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: () {
                  // Navigate to the search page here
                  // Replace 'SearchPage' with the actual name of your search page widget
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchRestaurantPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: searchBGC,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Icon(Icons.search_rounded),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 18,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
