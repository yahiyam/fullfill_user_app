import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/utils/instence.dart';

class PaymentService {
  Future<void> writeOrderDetailsForUser(Map<String, dynamic> data) async {
    final orderId = DateTime.now().millisecondsSinceEpoch.toString();
    final userId = sharedPreferences!.getString("uid");

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("orders")
        .doc(orderId)
        .set(data);
  }

  Future<void> writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    final orderId = DateTime.now().millisecondsSinceEpoch.toString();

    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(data);
  }
}
