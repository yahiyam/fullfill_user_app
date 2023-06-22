import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/items.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';
import 'package:fullfill_user_app/global/strings.dart';

import 'stepper_widget.dart';

Widget buildItemAvatar(Items item) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      SizedBox(height: Screen.height(33)),
      CircleAvatar(
        radius: Screen.height(13.8),
        backgroundImage: NetworkImage(
          item.thumbnailUrl ?? netFoodImage,
        ),
      ),
      Container(
        height: Screen.height(27.7),
        width: Screen.height(27.7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Screen.height(13.8)),
          gradient: RadialGradient(
            colors: [
              ...List.filled(6, Colors.transparent),
              backgroundColor!,
            ],
          ),
        ),
      ),
      Positioned(
        top: Screen.height(25),
        child: const StepperWidget(),
      ),
    ],
  );
}
