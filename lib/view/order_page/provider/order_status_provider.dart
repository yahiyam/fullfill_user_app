import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/instence.dart';

class OrderStatusProvider extends ChangeNotifier {
  List<Order> _ordersPending = [];
  List<Order> _ordersCompleted = [];

  List<Order> get ordersPending => _ordersPending;
  List<Order> get ordersCompleted => _ordersCompleted;

  Future<void> fetchOrderpending() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(sharedPreferences!.getString("uid"))
          .collection("orders")
          .where("status", isEqualTo: "normal")
          .orderBy("orderTime", descending: true)
          .get();

      _ordersPending = querySnapshot.docs.map((doc) {
        return Order.fromJson(doc.data());
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
        return Order.fromJson(doc.data());
      }).toList();

      notifyListeners();
    } catch (e) {
      log("Error fetching orders: $e");
    }
  }
}

class Order {
  final String orderId;
  final String addressID;
  final double totalAmount;
  final String orderBy;
  final List<String> productIDs;
  final String paymentDetails;
  final String orderTime;
  final bool isSuccess;
  final String sellerUID;
  final String riderUID;
  final String status;

  Order({
    required this.orderId,
    required this.addressID,
    required this.totalAmount,
    required this.orderBy,
    required this.productIDs,
    required this.paymentDetails,
    required this.orderTime,
    required this.isSuccess,
    required this.sellerUID,
    required this.riderUID,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      addressID: json['addressID'],
      totalAmount: json['totalAmount'],
      orderBy: json['orderBy'],
      productIDs: List<String>.from(json['productIDs']),
      paymentDetails: json['paymentDetails'],
      orderTime: json['orderTime'],
      isSuccess: json['isSuccess'],
      sellerUID: json['sellerUID'],
      riderUID: json['riderUID'],
      status: json['status'],
    );
  }
}
