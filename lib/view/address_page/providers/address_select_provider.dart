import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/address.dart';

class AddressSelectionProvider with ChangeNotifier {
  int _selectedAddressIndex = 0;
  List<Address> _addresses = [];
  final Set<int> _longPressedAddresses = <int>{};
  Address? _selectedAddress;
  int get selectedAddressIndex => _selectedAddressIndex;
  List<Address> get addresses => _addresses;
  Set<int> get longPressedAddresses => _longPressedAddresses;
  Address? get selectedAddress => _selectedAddress;

  Future<void> fetchAddresses(userUID) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUID)
          .collection('userAddress')
          .get();

      _addresses = querySnapshot.docs.map((doc) {
        final address = Address.fromJson(doc.data());
        address.id = doc.id;
        return address;
      }).toList();

      _selectedAddress = _addresses.isNotEmpty ? _addresses[_selectedAddressIndex] : null;

      notifyListeners();
    } catch (e) {
      log("Error fetching addresses: $e");
    }
  }

  void selectAddress(int index) {
    _selectedAddressIndex = index;
    _selectedAddress = _addresses.isNotEmpty ? _addresses[_selectedAddressIndex] : null;
    notifyListeners();
  }

  bool isAddressLongPressed(int index) {
    return _longPressedAddresses.contains(index);
  }

  void toggleAddressLongPressed(int index) {
    if (_longPressedAddresses.contains(index)) {
      _longPressedAddresses.remove(index);
    } else {
      _longPressedAddresses.add(index);
    }
    notifyListeners();
  }

  void deleteAddress(int index, String? userUID) async {
    try {
      final phoneNumber = _addresses[index].phoneNumber;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUID)
          .collection('userAddress')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });

      _addresses.removeAt(index);
      _longPressedAddresses.remove(index);

      notifyListeners();
    } catch (e) {
      log("Error deleting address: $e");
    }
  }

  void clearLongPressedState() {
    _longPressedAddresses.clear();
    notifyListeners();
  }
}
