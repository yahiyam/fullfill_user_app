import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/presentation/item_page/providers/stepper_provider.dart';

Widget buildItemInfo(StepperProvider stepperProvider,Items item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        item.title?.toUpperCase() ?? 'Food Name'.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
      Text(
        '$rupee${item.price! * stepperProvider.itemCount}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          color: commonColor,
        ),
      ),
    ],
  );
}
