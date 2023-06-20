import 'package:flutter/material.dart';

class AddressSelectionProvider with ChangeNotifier {
  int _selectedAddressIndex = 0;

  int get selectedAddressIndex => _selectedAddressIndex;

  void selectAddress(int index) {
    _selectedAddressIndex = index;
    notifyListeners();
  }
}
