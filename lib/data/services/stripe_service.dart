import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:fullfill_user_app/.env.example';

class StripeService {
  static const String _apiBase = 'https://api.stripe.com/v1';

  static String getPublishableKey() {
    const publishableKey = PUBLISHABLE_KEY;
    return publishableKey;
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(
      int amount, String currency) async {
    try {
      const secretKey = SECRET_KEY;

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
