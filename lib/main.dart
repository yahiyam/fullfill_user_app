import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fullfill_user_app/data/services/stripe_service.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/instence.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view_model/auth/auth_page_tabs_provider.dart';
import 'package:fullfill_user_app/view_model/auth/image_provider.dart';
import 'package:fullfill_user_app/view_model/auth/login_provider.dart';
import 'package:fullfill_user_app/view_model/auth/registeration_provider.dart';
import 'package:fullfill_user_app/view_model/my_orders/order_status_provider.dart';
import 'package:fullfill_user_app/view_model/payment/payment_selection_view_model.dart';
import 'package:fullfill_user_app/view_model/payment/payment_view_model.dart';
import 'package:fullfill_user_app/view_model/payment/stripe_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fullfill_user_app/view/auth/auth_page.dart';
import 'package:fullfill_user_app/view/home/home_page.dart';
import 'package:fullfill_user_app/view/get_started/get_started_page.dart';
import 'package:fullfill_user_app/view_model/cart/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/view_model/get_started/splash_provider.dart';
import 'package:fullfill_user_app/view_model/item_detail/stepper_provider.dart';
import 'package:fullfill_user_app/view_model/cart/total_amount.dart';

import 'view_model/list_address/address_select_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeService.getPublishableKey();
  await Stripe.instance.applySettings();
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
        ChangeNotifierProvider(create: (context) => StripeViewModel()),
        ChangeNotifierProvider(create: (context) => PaymentSelectionViewModel()),
        ChangeNotifierProvider(create: (context) => PaymentViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Screen.size = MediaQuery.sizeOf(context);

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