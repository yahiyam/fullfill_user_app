import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StripeService {
  static const String _apiBase = 'https://api.stripe.com/v1';

  static Future<String> getPublishableKey() async {
    await dotenv.load();
    final publishableKey = dotenv.env['PUBLISHABLE_KEY'];
    return publishableKey!;
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(
      int amount, String currency) async {
    try {
      await dotenv.load();
      final secretKey = dotenv.env['SECRET_KEY'];

      const url = '$_apiBase/payment_intents';
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final body = {
        'amount': amount.toString(),
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
}
