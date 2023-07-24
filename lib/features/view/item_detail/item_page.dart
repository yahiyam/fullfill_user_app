import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../data/models/item.dart';
import '../../view_model/item_detail/stepper_provider.dart';
import 'widgets/item_add_to_cart.dart';
import 'widgets/item_avatar.dart';
import 'widgets/item_info.dart';
import 'widgets/item_page_app_bar.dart';
import 'widgets/item_short_info.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<StepperProvider>(context, listen: false).reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: ItemAppBar(item: item),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemImageandCounter(item: item),
            ItemInfo(item: item),
            ShortInfo(item: item),
            AddToCartButton(item: item),
          ],
        ),
      ),
    );
  }
}
