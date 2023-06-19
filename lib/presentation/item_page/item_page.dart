import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/item_add_to_cart.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/item_avatar.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/item_info.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/item_page_app_bar.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/item_short_info.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/data/models/items.dart';

import 'package:fullfill_user_app/globals/colors.dart';

import 'package:fullfill_user_app/presentation/item_page/providers/stepper_provider.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<StepperProvider>(context, listen: false).reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: buildItemAppBar(context, item),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildItemAvatar(item),
            buildItemInfo(context, item),
            buildShortInfo(item),
            buildAddToCartButton(context, item),
          ],
        ),
      ),
    );
  }
}
