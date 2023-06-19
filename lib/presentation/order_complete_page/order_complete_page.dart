import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';


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
              color: black,
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
