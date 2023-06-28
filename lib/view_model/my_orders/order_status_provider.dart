import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/order.dart';
import 'package:fullfill_user_app/utils/instence.dart';

class OrderStatusProvider extends ChangeNotifier {
  List<MyOrder> pendingOrders = [];
  List<MyOrder> _ordersCompleted = [];

  List<MyOrder> get ordersPending => pendingOrders;
  List<MyOrder> get ordersCompleted => _ordersCompleted;

  Future<void> fetchOrderpending() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(sharedPreferences!.getString("uid"))
          .collection("orders")
          .where("status", isEqualTo: "normal")
          .orderBy("orderTime", descending: true)
          .get();

      pendingOrders = querySnapshot.docs.map((doc) {
        return MyOrder.fromJson(doc.data());
      }).toList();

      notifyListeners();
    } catch (e) {
      log("Error fetching orders: $e");
    }
  }

  Future<void> fetchOrderCompleted() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(sharedPreferences!.getString("uid"))
          .collection("orders")
          .where("status", isEqualTo: "completed")
          .orderBy("orderTime", descending: true)
          .get();

      _ordersCompleted = querySnapshot.docs.map((doc) {
        return MyOrder.fromJson(doc.data());
      }).toList();

      notifyListeners();
    } catch (e) {
      log("Error fetching orders: $e");
    }
  }
}