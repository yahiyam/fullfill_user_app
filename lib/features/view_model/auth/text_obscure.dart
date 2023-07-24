import 'package:flutter/material.dart';

class Obscure extends ChangeNotifier {
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  bool _isTyped = false;
  bool get isTyped => _isTyped;
  void toggleTyped(value) {
    _isTyped = value.isNotEmpty;

    notifyListeners();
  }
}
