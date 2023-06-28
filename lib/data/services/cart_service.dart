import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fullfill_user_app/utils/instence.dart';


class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addItemToCart(
    List<String>? tempList,
  ) async {
    try {
      await _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        "userCart": tempList,
      });
    } catch (e) {
      log("Error adding item to cart: $e");
    }
  }

  Future<void> clearCartNow(List<String>? emptyList) async {
    try {
      await _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"userCart": emptyList});
    } catch (e) {
      log("Error clearing cart: $e");
    }
  }
  
}
