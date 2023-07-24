import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'widgets/card_proceed_button.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/cart_items.dart';
import 'widgets/cart_summery.dart';

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
