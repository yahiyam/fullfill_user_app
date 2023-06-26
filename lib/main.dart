import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/view/my_order_page/provider/order_status_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fullfill_user_app/global/screen_size.dart';

import 'package:fullfill_user_app/view/auth_page/providers/auth_page_tabs_provider.dart';
import 'package:fullfill_user_app/view/auth_page/providers/login_provider.dart';
import 'package:fullfill_user_app/view/auth_page/providers/registeration_provider.dart';
import 'package:fullfill_user_app/view/auth_page/providers/image_provider.dart';
import 'package:fullfill_user_app/view/auth_page/auth_page.dart';
import 'package:fullfill_user_app/view/home_page/home_page.dart';
import 'package:fullfill_user_app/view/get_started_page/get_started_page.dart';
import 'package:fullfill_user_app/view/cart_page/providers/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/view/get_started_page/providers/splash_provider.dart';
import 'package:fullfill_user_app/view/item_page/providers/stepper_provider.dart';
import 'package:fullfill_user_app/view/cart_page/providers/total_amount.dart';

import 'global/colors.dart';
import 'global/instence.dart';

import 'view/address_page/providers/address_select_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartItemCounter()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => RegisterationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ImagesProvider()),
        ChangeNotifierProvider(create: (context) => AuthTabsProvider()),
        ChangeNotifierProvider(create: (context) => StepperProvider()),
        ChangeNotifierProvider(create: (context) => TotalAmount()),
        ChangeNotifierProvider(create: (context) => AddressSelectionProvider()),
        ChangeNotifierProvider(create: (context) => OrderStatusProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Screen.size = MediaQuery.of(context).size;

    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FULLFILL',
      initialRoute: '/splash',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: commonColor,
        ),
      ),
      routes: {
        '/splash': (context) => Consumer<SplashProvider>(
              builder: (context, splashProvider, child) {
                // if user is logged in
                if (splashProvider.hasShownSplash) {
                  if (firebaseAuth.currentUser != null) {
                    return const HomePage();
                  } else {
                    return const AuthPage();
                  }
                } else {
                  return const GetStartedPage();
                }
              },
            ),
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
/* 
// predicate
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => route.settings.name == '/stopRemovalRoute',
);
 */