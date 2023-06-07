import 'package:flutter/material.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool _passwordVisible = false;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }
}
