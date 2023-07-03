import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:fullfill_user_app/.env.example';

class StripeService {
  static const String _apiBase = 'https://api.stripe.com/v1';

  static String getPublishableKey() {
    return PUBLISHABLE_KEY;
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(
    num amount, [
    String currency = 'INR',
  ]) async {
    try {
      const secretKey = SECRET_KEY;

      const url = '$_apiBase/payment_intents';
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final body = {
        'amount': convertAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      final responseData = json.decode(response.body);

      return responseData;
    } catch (e) {
      log('Error creating payment intent: $e');
      return null;
    }
  }

  static displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        log('Payment successful');
      });
    } on StripeException catch (e) {
      log('Error displaying payment sheet: $e');
    }
  }

  static initializePaymentSheet(Map<String, dynamic> paymentIntent) async {
    try {
      const gpay = PaymentSheetGooglePay(
        merchantCountryCode: 'GB',
        currencyCode: 'GBP',
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Abhi',
          googlePay: gpay,
        ),
      );
      await Stripe.instance.presentPaymentSheet().then((value) {
        log('Payment successful');
      });
    } catch (e) {
      log('Error displaying payment sheet: $e');
    }
  }

  static String convertAmount(num amount) {
    final price = amount * 100;
    return price.toString();
  }
}
