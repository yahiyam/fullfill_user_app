import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/view/cart/widgets/card_proceed_button.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_app_bar.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_items.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_summery.dart';

class CartPage extends StatelessWidget {
  final String sellerUID;

  const CartPage({
    super.key,
    required this.sellerUID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CartAppbar(),
      body: CustomScrollView(
        slivers: [
          const CartItems(),
          const CartSummary(),
          CartProceedButton(sellerUID: sellerUID),
        ],
      ),
    );
  }
}
