import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:fullfill_user_app/.env';

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

  static Future<String> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      log('Payment successful');
      return 'successful';
    } on StripeException catch (e) {
      log('Error displaying payment sheet: $e');
    }
    return 'failed';
  }

  static initializePaymentSheet(Map<String, dynamic> paymentIntent) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'FULLFILL',
        ),
      );
    } catch (e) {
      log('Error initializing payment sheet: $e');
    }
  }

  static String convertAmount(num amount) {
    final price = amount * 100;
    return price.toString();
  }
}
