import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/utils/strings.dart';

import 'stepper_widget.dart';

class ItemImageandCounter extends StatelessWidget {
  const ItemImageandCounter({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
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
}
