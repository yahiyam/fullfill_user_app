// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view_model/cart/total_amount.dart';
import 'package:fullfill_user_app/view_model/payment/payment_selection_view_model.dart';
import 'package:fullfill_user_app/view_model/payment/payment_view_model.dart';
import 'package:fullfill_user_app/view_model/payment/stripe_view_model.dart';
import 'package:provider/provider.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.sellerUID,
  });

  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    final paymentViewModel = context.watch<PaymentViewModel>();
    final int amount = context.read<TotalAmount>().grandTotal.toInt();
    return Consumer2<StripeViewModel, PaymentSelectionViewModel>(builder: (
      context,
      stripe,
      paymentSelector,
      _,
    ) {
      if (paymentSelector.selectedPaymentIndex == 0) {
        return CommonButton(
          title: 'Pay the amount',
          onTap: () async {
            String status = await stripe.selectPayment(amount);
            if (status == 'successful') {
              log(status);
              paymentViewModel.addOrderDetails(context, sellerUID);
            } else {}
          },
        );
      }
      if (paymentSelector.selectedPaymentIndex == 2) {
        return CommonButton(
          title: 'Place Order',
          onTap: () {
            paymentViewModel.addOrderDetails(context, sellerUID);
          },
        );
      }
      return SizedBox(height: Screen.height(8));
    });
  }
}
