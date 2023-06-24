import 'package:flutter/material.dart';

import 'package:fullfill_user_app/view/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view/cart_page/providers/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/view/restaurant_page/widgets/app_bar.dart';
import 'package:fullfill_user_app/view/restaurant_page/widgets/body_section.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/utils/alert_message.dart';
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
        bool isCartNotEmpty = context.read<CartItemCounter>().count != 0;
        if (isCartNotEmpty) {
          await showAlertMessege(
            context,
            message: 'Your cart will be cleared from this store!',
            onOKTap: () {
              clearCartNow(context);
            },
          );
        } else {
          Navigator.of(context).pop();
        }

        return false;
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
