import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/instence.dart';
import '../../../utils/toast_message.dart';
import '../../data/services/payment_service.dart';
import '../../view/cart/functions/assistant_methods.dart';
import '../../view/home/home_page.dart';
import '../cart/total_amount.dart';
import '../list_address/address_select_provider.dart';

class PaymentViewModel extends ChangeNotifier {
  final PaymentService _paymentService = PaymentService();

  void addOrderDetails(BuildContext context, String sellerUID) {
    final totalAmount = context.read<TotalAmount>().grandTotal;
    final address = context.read<AddressSelectionProvider>().selectedAddress;

    if (address != null) {
      final data = {
        "addressID": address.id,
        "totalAmount": totalAmount,
        "orderBy": sharedPreferences!.getString("uid"),
        "productIDs": sharedPreferences!.getStringList("userCart"),
        "paymentDetails": "Cash on Delivery",
        "orderTime": DateTime.now().millisecondsSinceEpoch.toString(),
        "isSuccess": true,
        "sellerUID": sellerUID,
        "riderUID": "",
        "status": "normal",
      };

      _paymentService.writeOrderDetailsForUser(data).then((_) {
        _paymentService.writeOrderDetailsForSeller(data).then((_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          clearCartNow(context, false);
          ToastMessage.show(
            context,
            "Congratulations,\nOrder has been placed successfully.\nContinue Shopping.",
            "assets/success.gif",
          );
        });
      });
    } else {
      ToastMessage.show(context, "Please select an address");
    }
  }
}
