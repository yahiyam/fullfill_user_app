import 'package:flutter/material.dart';

import '../../data/models/address.dart';
import '../../data/services/address_service.dart';

class AddressSelectionProvider with ChangeNotifier {
  int _selectedAddressIndex = 0;
  List<Address> _addresses = [];
  final Set<int> _longPressedAddresses = <int>{};
  Address? _selectedAddress;

  final AddressService _addressService = AddressService();

  int get selectedAddressIndex => _selectedAddressIndex;
  List<Address> get addresses => _addresses;
  Set<int> get longPressedAddresses => _longPressedAddresses;
  Address? get selectedAddress => _selectedAddress;

  Future<void> fetchAddresses() async {
    _addresses = await _addressService.fetchAddresses();

    _selectedAddress =
        _addresses.isNotEmpty ? _addresses[_selectedAddressIndex] : null;

    notifyListeners();
  }

  void selectAddress(int index) {
    _selectedAddressIndex = index;
    _selectedAddress =
        _addresses.isNotEmpty ? _addresses[_selectedAddressIndex] : null;
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
    final phoneNumber = _addresses[index].phoneNumber;

    await _addressService.deleteAddress(phoneNumber!);

    _addresses.removeAt(index);
    _longPressedAddresses.remove(index);

    notifyListeners();
  }

  void clearLongPressedState() {
    _longPressedAddresses.clear();
    notifyListeners();
  }
}
