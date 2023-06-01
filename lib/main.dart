import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/RestaurantPage/restaurant_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/connection_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/history_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/my_offer_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/order_complete_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/order_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/search_page.dart';
import 'package:fullfill_user_app/presentation/HomePage/home_page.dart';
import 'package:fullfill_user_app/presentation/AuthPage/auth_page.dart';
import 'package:fullfill_user_app/presentation/profile/profile_page.dart';
import 'package:fullfill_user_app/presentation/splash_page.dart';
import 'package:fullfill_user_app/provider/auth_provider.dart';
import 'package:fullfill_user_app/provider/splash_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FULLFILL',
      initialRoute: '/splash',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      routes: {
        '/splash': (context) => Consumer<SplashProvider>(
              builder: (context, splashProvider, child) {
                if (splashProvider.hasShownSplash) {
                  return const AuthPage();
                } else {
                  return const SplashPage();
                }
              },
            ),
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
        '/restaurant': (context) => const RestaurantPage(),
        '/connectionError': (context) => const ConnectionErrorPage(),
        '/history': (context) => const HistoryPage(),
        '/myOffer': (context) => const MyOfferPage(),
        '/orderComplete': (context) => const OrderCompletePage(),
        '/order': (context) => const OrderPage(),
        '/search': (context) => const SearchPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
