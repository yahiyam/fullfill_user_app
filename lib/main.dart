import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/emptyPages/connection_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/history_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/my_offer_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/order_complete_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/order_page.dart';
import 'package:fullfill_user_app/presentation/emptyPages/search_page.dart';

import 'package:fullfill_user_app/presentation/splash_page.dart';
import 'package:fullfill_user_app/provider/splash_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SplashProvider(),
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
          // useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      routes: {
        '/splash': (context) => Consumer<SplashProvider>(
              builder: (context, splashProvider, child) {
                if (splashProvider.hasShownSplash) {
                  return const HomePage();
                } else {
                  return const SplashPage();
                }
              },
            ),
        '/home': (context) => const HomePage(),
        '/connectionError': (context) => const ConnectionErrorPage(),
        '/history': (context) => const HistoryPage(),
        '/myOffer': (context) => const MyOfferPage(),
        '/orderComplete': (context) => const OrderCompletePage(),
        '/order': (context) => const OrderPage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Scrollable AppBar'),
            floating: true,
            snap: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/icon.png', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
