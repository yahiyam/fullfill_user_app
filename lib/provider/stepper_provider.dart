import 'package:flutter/material.dart';

class StepperProvider with ChangeNotifier {
@override
  void dispose() {
   print('hello');
    super.dispose();
  }

  late int _itemCount = 1;

  int get itemCount => _itemCount;

  void incrementItemCount() {
    _itemCount++;
    notifyListeners();
  }

  void decrementItemCount() {
    if (itemCount > 1) {
     _itemCount--;
    }
    notifyListeners();
  }

  void reset() {
    _itemCount = 1;
    notifyListeners();
  }
}
