import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../utils/alert_message.dart';
import '../../data/models/seller.dart';
import '../../view_model/cart/cart_item_counter_provider.dart';
import '../cart/functions/assistant_methods.dart';
import 'widgets/app_bar.dart';
import 'widgets/body_section.dart';
import 'widgets/bottom_button.dart';

class RestaurantPage extends StatelessWidget {
  final Seller seller;

  const RestaurantPage({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemCounter>(builder: (context, cart, _) {
      return WillPopScope(
        onWillPop: () async {
          if (cart.count != 0) {
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
          bottomNavigationBar: BottomButton(cart: cart, seller: seller),
          body: CustomScrollView(
            slivers: [
              RestaurantAppBar(seller: seller),
              BodySection(seller: seller),
            ],
          ),
        ),
      );
    });
  }
}
