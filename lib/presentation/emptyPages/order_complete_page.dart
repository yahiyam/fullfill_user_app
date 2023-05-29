import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Order Complete',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
              height: 3,
              letterSpacing: -1.7,
              color: Color(0xff000000),
            ),
          ),
          const EmptyPageMessege(
            icon: Icons.shopping_cart_outlined,
            mainTitle: 'Thank you for Ordering',
            subTitle: 'Your delivery will be in\nsoon',
          ),
          CommonButton(
            title: 'Continue ',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
