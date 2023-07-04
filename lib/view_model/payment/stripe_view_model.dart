import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/services/stripe_service.dart';

class StripeViewModel extends ChangeNotifier {
  Map<String, dynamic>? paymentIntent;

  Future<dynamic> selectPayment(int amount) async {
    paymentIntent = await StripeService.createPaymentIntent(amount);

    await StripeService.initializePaymentSheet(paymentIntent!);
    String status = await StripeService.displayPaymentSheet();
    log('message status $status');
    return status;
  }
}
