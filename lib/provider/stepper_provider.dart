import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  late int _itemCount = 0;

  int get itemCount => _itemCount;

  void incrementItemCount() {
    _itemCount++;
    notifyListeners();
  }

  void decrementItemCount() {
    if (itemCount <= 1) {
      _itemCount = 1;
    } else {
      _itemCount--;
    }
    notifyListeners();
  }
}