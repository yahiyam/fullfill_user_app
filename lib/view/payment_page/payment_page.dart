import 'package:flutter/material.dart';

import 'package:fullfill_user_app/global/colors.dart';

import 'package:fullfill_user_app/view/payment_page/widgets/order_button.dart';
import 'package:fullfill_user_app/view/payment_page/widgets/payment_amount.dart';
import 'package:fullfill_user_app/view/payment_page/widgets/payment_selection.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/functions/simple_heading.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSimpleAppBar(context, 'Payment'),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSimpleHeading('Select your payment method'),
          buildPaymentSelection(),
          buildDisplayAmount(context),
          buildOrderButton(),
        ],
      ),
    );
  }
}
