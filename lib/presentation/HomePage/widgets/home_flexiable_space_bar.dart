import 'package:flutter/material.dart';
import 'package:fullfill_user_app/Globals/colors.dart';
import 'package:fullfill_user_app/presentation/HomePage/functions/meal_categories.dart';

import '../../../Globals/instence.dart';

class HomeFlexibleSpaceBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const HomeFlexibleSpaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final String currentCategory = getMealCategory();
    return FlexibleSpaceBar(
      background: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Welcome ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: sharedPreferences!.getString("name")!,
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: orange,
                      ),
                    ),
                    const TextSpan(
                      text: '.\nWhat do you want for ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: currentCategory,
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: orange,
                      ),
                    ),
                    const TextSpan(
                      text: '. ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Icon(Icons.search_rounded),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: const Color(0xFFEFEEEE),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
