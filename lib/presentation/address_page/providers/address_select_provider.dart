import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/address.dart';

class AddressSelectionProvider with ChangeNotifier {
  int _selectedAddressIndex = 0;
  List<Address> _addresses = [];

  int get selectedAddressIndex => _selectedAddressIndex;
  List<Address> get addresses => _addresses;

  Future<void> fetchAddresses(userUID) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUID)
          .collection('address')
          .get();

      _addresses = querySnapshot.docs
          .map((doc) => Address.fromJson(doc.data()))
          .toList();

      notifyListeners();
    } catch (e) {
      log("Error fetching addresses: $e");
    }
  }

  void selectAddress(int index) {
    _selectedAddressIndex = index;
    notifyListeners();
  }
}
