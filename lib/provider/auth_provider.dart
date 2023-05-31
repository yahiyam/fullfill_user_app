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

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void navigateToLogin() {
    _currentIndex = 0;
    notifyListeners();
  }

  void navigateToSignUp() {
    _currentIndex = 1;
    notifyListeners();
  }
}
