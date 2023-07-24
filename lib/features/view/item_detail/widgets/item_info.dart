import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/strings.dart';
import '../../../data/models/item.dart';
import '../../../view_model/item_detail/stepper_provider.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
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
}
