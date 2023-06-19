import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/items.dart';

import 'package:fullfill_user_app/globals/screen_size.dart';

Widget buildShortInfo(Items item) {
  return SizedBox(
    height: Screen.height(31),
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Screen.width(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Food's short info".toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            item.shortInfo ?? "Food's short info",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}
