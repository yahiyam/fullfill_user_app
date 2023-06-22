import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/strings.dart';
import 'package:fullfill_user_app/view/item_page/providers/stepper_provider.dart';
import 'package:provider/provider.dart';

Widget buildItemInfo(BuildContext context, Items item) {
  final stepperProvider = Provider.of<StepperProvider>(context);

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
