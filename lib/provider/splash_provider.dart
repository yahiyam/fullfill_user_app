import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  static const String _prefKey = 'hasShownSplash';
  bool _hasShownSplash = false;

  bool get hasShownSplash => _hasShownSplash;

  Future<void> initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasShownSplash = prefs.getBool(_prefKey) ?? false;
  }

  Future<void> markSplashAsShown() async {
    _hasShownSplash = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
  }
}
