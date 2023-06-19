import 'package:flutter/material.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';

import 'package:fullfill_user_app/presentation/home_page/functions/meal_categories.dart';

SliverToBoxAdapter buildHeader() {
  final String currentCategory = getMealCategory();
  final String userName = sharedPreferences!.getString("name")!.toUpperCase();

  return SliverToBoxAdapter(
    child: SizedBox(
      height: Screen.height(22) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildWelcomeMessage(userName, currentCategory),
          const SizedBox(height: 20),
          _buildSearchTextField(),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

Widget _buildWelcomeMessage(String userName, String currentCategory) {
  return RichText(
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
  );
}

Widget _buildSearchTextField() {
  return Padding(
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
        fillColor: searchBGC,
        hintText: 'Search',
        hintStyle: const TextStyle(
          fontSize: 18,
          color: grey,
        ),
      ),
    ),
  );
}
