import 'package:flutter/material.dart';

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
    final splashProvider = Provider.of<SplashProvider>(context,listen: false);
    splashProvider.initialize();
    return MaterialApp(
      title: 'FULLFILL',
      home: Consumer<SplashProvider>(
        builder: (context, splashProvider, child) {
          if (splashProvider.hasShownSplash) {
            return const HomePage();
          } else {
            return SplashPage(
              onDismiss: () => splashProvider.markSplashAsShown(),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome'),
      ),
    );
  }
}
