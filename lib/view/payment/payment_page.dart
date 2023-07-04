import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';

import 'package:fullfill_user_app/view/payment/widgets/order_button.dart';
import 'package:fullfill_user_app/view/payment/widgets/payment_amount.dart';
import 'package:fullfill_user_app/view/payment/widgets/payment_selection.dart';

import 'package:fullfill_user_app/utils/widgets/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/widgets/simple_heading.dart';
import 'package:fullfill_user_app/view_model/payment/payment_view_model.dart';
import 'package:provider/provider.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({
//     super.key,
//     required this.sellerUID,
//   });

//   final String sellerUID;
//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   String orderId = DateTime.now().millisecondsSinceEpoch.toString();
//   addOrderDetails() {
//     double totalAmount = context.read<TotalAmount>().grandTotal;
//     Address? address = context.read<AddressSelectionProvider>().selectedAddress;
//     writeOrderDetailsForUser({
//       "addressID": address!.id,
//       "totalAmount": totalAmount,
//       "orderBy": sharedPreferences!.getString("uid"),
//       "productIDs": sharedPreferences!.getStringList("userCart"),
//       "paymentDetails": "Cash on Delivery",
//       "orderTime": orderId,
//       "isSuccess": true,
//       "sellerUID": widget.sellerUID,
//       "riderUID": "",
//       "status": "normal",
//       "orderId": orderId,
//     });

//     writeOrderDetailsForSeller({
//       "addressID": address.id,
//       "totalAmount": totalAmount,
//       "orderBy": sharedPreferences!.getString("uid"),
//       "productIDs": sharedPreferences!.getStringList("userCart"),
//       "paymentDetails": "Cash on Delivery",
//       "orderTime": orderId,
//       "isSuccess": true,
//       "sellerUID": widget.sellerUID,
//       "riderUID": "",
//       "status": "normal",
//       "orderId": orderId,
//     }).then((_) {
//       setState(() {
//         orderId = "";
//       });
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const HomePage()));
//       clearCartNow(context, false);
//       ToastMessage.show(
//         context,
//         "\nCongratulations,\nOrder has been placed successfully.\n Continue Shoping.\n",
//       );
//     });
//   }

//   Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(sharedPreferences!.getString("uid"))
//         .collection("orders")
//         .doc(orderId)
//         .set(data);
//   }

//   Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
//     await FirebaseFirestore.instance
//         .collection("orders")
//         .doc(orderId)
//         .set(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const SimpleAppBar(title: 'Payment'),
//       backgroundColor: backgroundColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SimpleHeading(title: 'Select your payment method'),
//           const PaymentSelection(),
//           const DisplayAmount(),
//           OrderButton(placeOrder: addOrderDetails()),
//         ],
//       ),
//     );
//   }
// }

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
