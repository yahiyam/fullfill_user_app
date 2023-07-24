import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/common_button.dart';
import '../../../../utils/screen_size.dart';
import '../../../view_model/payment/payment_selection_view_model.dart';
import '../../../view_model/payment/payment_view_model.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.sellerUID,
  });

  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    final paymentViewModel = context.watch<PaymentViewModel>();
    return Consumer<PaymentSelectionViewModel>(builder: (
      context,
      paymentSelector,
      _,
    ) {
      if (paymentSelector.selectedPaymentIndex == 0) {
        return CommonButton(
          title: 'Pay the amount',
          onTap: () {},
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
