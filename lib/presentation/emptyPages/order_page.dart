import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Orders'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EmptyPageMessege(
            icon: Icons.shopping_cart_outlined,
            mainTitle: 'No orders yet',
            subTitle: 'Hit the orange button down\nbelow to Create an order',
          ),
          CommonButton(title: 'Start ordering'),
        ],
      ),
    );
  }
}
