import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/instence.dart';
import '../auth/auth_page.dart';
import '../get_started/get_started_page.dart';
import '../home/home_page.dart';

class SplashScreen extends StatelessWidget {
  static const String _prefKey = 'hasShownSplash';

  const SplashScreen({super.key});

  Future<bool> hasShownSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefKey) ?? false;
  }

  Future<void> markSplashAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: hasShownSplash(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.data == true) {
            if (firebaseAuth.currentUser != null) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          } else {
            markSplashAsShown();
            return const GetStartedPage();
          }
        }
      },
    );
  }
}
