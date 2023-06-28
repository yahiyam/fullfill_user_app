import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';


AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        SizedBox(
          width: Screen.width(40),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.place_outlined,
                color: commonColor,
              ),
              Text(
                'Location',
                style: TextStyle(fontSize: 18),
              ),
              Icon(
                Icons.expand_more_rounded,
                color: commonColor,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag),
        ),
      ],
    ),
  );
}
