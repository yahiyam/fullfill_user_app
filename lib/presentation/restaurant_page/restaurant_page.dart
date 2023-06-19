import 'package:flutter/material.dart';

import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/app_bar.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/body_section.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:provider/provider.dart';

class RestaurantPage extends StatelessWidget {
  final Sellers seller;

  const RestaurantPage({
    super.key,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        clearCartNow(context);
        Provider.of<CartItemCounter>(context, listen: false)
            .displayCartListItemsNumber();

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          slivers: [
            buildAppBar(context, seller),
            buildBodySection(seller),
          ],
        ),
      ),
    );
  }
}
