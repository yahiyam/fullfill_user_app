import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../utils/widgets/simple_app_bar.dart';
import '../../../utils/widgets/simple_heading.dart';
import '../../view_model/payment/payment_view_model.dart';
import 'widgets/order_button.dart';
import 'widgets/payment_amount.dart';
import 'widgets/payment_selection.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
    required this.sellerUID,
  });

  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentViewModel>(
      create: (context) => PaymentViewModel(),
      child: Scaffold(
        appBar: const SimpleAppBar(title: 'Payment'),
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SimpleHeading(title: 'Select your payment method'),
            const PaymentSelection(),
            const DisplayAmount(),
            OrderButton(sellerUID: sellerUID),
          ],
        ),
      ),
    );
  }
}
