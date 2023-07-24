import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/screen_size.dart';
import '../../../../utils/strings.dart';
import '../../../data/models/item.dart';
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
