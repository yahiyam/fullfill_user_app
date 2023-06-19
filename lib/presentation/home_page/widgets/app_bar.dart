import 'package:flutter/material.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/globals/text_style.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        SizedBox(
          width: Screen.width(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.place_outlined,
                color: commonColor,
              ),
              Text(
                'Location',
                style: CommonUtils.getTextStyle(fontSize: 18),
              ),
              const Icon(
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
