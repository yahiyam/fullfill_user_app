import 'package:flutter/material.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';

import 'package:fullfill_user_app/view/payment_page/widgets/payment_type_card.dart';

Padding buildPaymentSelection() {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Container(
          height: Screen.height(16.6),
          width: double.infinity,
          decoration: BoxDecoration(
            color: white70,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentTypeCard(
                type: 'Card',
                icon: Icons.payment,
                isSelected: true,
                iconBGcolor: commonColor,
              ),
              PaymentTypeCard(
                type: 'UPI',
                icon: Icons.account_balance_rounded,
                iconBGcolor: pink,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
