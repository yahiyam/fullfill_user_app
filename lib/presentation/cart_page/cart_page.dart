import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/presentation/cart_page/widgets/cart_card.dart';

import '../widgets/common_widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.sellerUID});
  final String sellerUID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(title: 'Cart'),
      body: Stack(
        alignment: const AlignmentDirectional(0, .94),
        children: [
          ListView.builder(
            itemCount: 6,
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (context, index) {
              return const CartCard();
            },
          ),
          // const EmptyPageMessege(
          //   icon: Icons.shopping_cart_outlined,
          //   mainTitle: 'No orders yet',
          //   subTitle: 'Hit the orange button down\nbelow to Create an order',
          // ),
          CommonButton(
            title: 'Proceed Order',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
