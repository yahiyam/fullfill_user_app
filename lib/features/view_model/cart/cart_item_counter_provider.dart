import 'package:flutter/cupertino.dart';
import '../../../utils/instence.dart';

class CartItemCounter extends ChangeNotifier {
  int _cartListItemCounter = sharedPreferences!.getStringList("userCart")!.length - 1;
  int get count => _cartListItemCounter;

  Future<void> displayCartListItemsNumber() async {
    _cartListItemCounter = sharedPreferences!.getStringList("userCart")!.length - 1;

    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}
