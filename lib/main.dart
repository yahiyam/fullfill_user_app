import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/colors.dart';
import 'features/view/auth/auth_page.dart';
import 'features/view/home/home_page.dart';
import 'features/view/splash/splash_screen.dart';
import 'features/view_model/auth/auth_page_tabs_provider.dart';
import 'features/view_model/auth/image_provider.dart';
import 'features/view_model/auth/login_provider.dart';
import 'features/view_model/auth/registeration_provider.dart';
import 'features/view_model/cart/cart_item_counter_provider.dart';
import 'features/view_model/cart/total_amount.dart';
import 'features/view_model/item_detail/stepper_provider.dart';
import 'features/view_model/list_address/address_select_provider.dart';
import 'features/view_model/my_orders/order_status_provider.dart';
import 'features/view_model/payment/payment_selection_view_model.dart';
import 'features/view_model/payment/payment_view_model.dart';
import 'utils/instence.dart';
import 'utils/screen_size.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartItemCounter()),
        ChangeNotifierProvider(create: (context) => RegisterationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ImagesProvider()),
        ChangeNotifierProvider(create: (context) => AuthTabsProvider()),
        ChangeNotifierProvider(create: (context) => StepperProvider()),
        ChangeNotifierProvider(create: (context) => TotalAmount()),
        ChangeNotifierProvider(create: (context) => AddressSelectionProvider()),
        ChangeNotifierProvider(create: (context) => OrderStatusProvider()),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FULLFILL',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: commonColor,
        ),
      ),
      routes: {
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
      },
      home: const SplashScreen(),
    );
  }
}
