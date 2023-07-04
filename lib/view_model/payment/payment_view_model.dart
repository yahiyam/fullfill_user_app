import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/services/payment_service.dart';
import 'package:fullfill_user_app/utils/instence.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';
import 'package:fullfill_user_app/view/cart/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view/home/home_page.dart';
import 'package:fullfill_user_app/view_model/cart/total_amount.dart';
import 'package:fullfill_user_app/view_model/list_address/address_select_provider.dart';
import 'package:provider/provider.dart';

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
          );
        });
      });
    } else {
      ToastMessage.show(context, "Please select an address");
    }
  }
}
