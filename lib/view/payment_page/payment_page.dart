import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/address.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/instence.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';
import 'package:fullfill_user_app/view/address_page/providers/address_select_provider.dart';
import 'package:fullfill_user_app/view/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view/cart_page/providers/total_amount.dart';
import 'package:fullfill_user_app/view/home_page/home_page.dart';

import 'package:fullfill_user_app/view/payment_page/widgets/order_button.dart';
import 'package:fullfill_user_app/view/payment_page/widgets/payment_amount.dart';
import 'package:fullfill_user_app/view/payment_page/widgets/payment_selection.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/functions/simple_heading.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.sellerUID,
  });

  final String sellerUID;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String orderId = DateTime.now().millisecondsSinceEpoch.toString();
  addOrderDetails() {
    double totalAmount = context.read<TotalAmount>().grandTotal;
    Address? address = context.read<AddressSelectionProvider>().selectedAddress;
    writeOrderDetailsForUser({
      "addressID": address!.id,
      "totalAmount": totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    });

    writeOrderDetailsForSeller({
      "addressID": address.id,
      "totalAmount": totalAmount,
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails": "Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "sellerUID": widget.sellerUID,
      "riderUID": "",
      "status": "normal",
      "orderId": orderId,
    }).whenComplete(() {
      clearCartNow(context);
      setState(() {
        orderId = "";
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        ToastMessage.show(
          context,
          "Congratulations, Order has been placed successfully.",
        );
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
      });
    });
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(sharedPreferences!.getString("uid"))
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSimpleAppBar(context, 'Payment'),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSimpleHeading('Select your payment method'),
          buildPaymentSelection(),
          buildDisplayAmount(context),
          buildOrderButton(() {
            addOrderDetails();
          }),
        ],
      ),
    );
  }
}
