import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoginSelected = true;

  bool get isLoginSelected => _isLoginSelected;

  void selectLogin() {
    _isLoginSelected = true;
    notifyListeners();
  }

  void selectSignUp() {
    _isLoginSelected = false;
    notifyListeners();
  }
}
