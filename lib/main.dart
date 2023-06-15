import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/checkout_page/checkout_delivery_page.dart';
import 'package:fullfill_user_app/presentation/checkout_page/checkout_patment.dart';
import 'package:fullfill_user_app/presentation/empty_pages/connection_page.dart';
import 'package:fullfill_user_app/presentation/empty_pages/history_page.dart';
import 'package:fullfill_user_app/presentation/empty_pages/my_offer_page.dart';
import 'package:fullfill_user_app/presentation/empty_pages/order_complete_page.dart';
import 'package:fullfill_user_app/presentation/empty_pages/order_page.dart';
import 'package:fullfill_user_app/presentation/empty_pages/search_page.dart';
import 'package:fullfill_user_app/presentation/home_page/home_page.dart';
import 'package:fullfill_user_app/presentation/auth_page/auth_page.dart';
import 'package:fullfill_user_app/presentation/profile_page/profile_page.dart';
import 'package:fullfill_user_app/presentation/get_started_page.dart';
import 'package:fullfill_user_app/provider/auth_page_tabs_provider.dart';
import 'package:fullfill_user_app/provider/login_provider.dart';
import 'package:fullfill_user_app/provider/registeration_provider.dart';
import 'package:fullfill_user_app/provider/image_provider.dart';
import 'package:fullfill_user_app/provider/splash_provider.dart';
import 'package:fullfill_user_app/provider/stepper_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals/colors.dart';
import 'globals/instence.dart';
import 'presentation/empty_pages/privacy_page.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => RegisterationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ImagesProvider()),
        ChangeNotifierProvider(create: (context) => AuthTabsProvider()),
        ChangeNotifierProvider(create: (context) => StepperProvider()),
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
        '/connectionError': (context) => const ConnectionErrorPage(),
        '/history': (context) => const HistoryPage(),
        '/myOffer': (context) => const MyOfferPage(),
        '/orderComplete': (context) => const OrderCompletePage(),
        '/order': (context) => const OrderPage(),
        '/search': (context) => const SearchPage(),
        '/profile': (context) => const ProfilePage(),
        '/privacy': (context) => const PrivacyPage(),
        '/delivery': (context) => const DeliveryPage(),
        '/payment': (context) => const PaymentPage(),
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