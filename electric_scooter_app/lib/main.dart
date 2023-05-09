import 'package:electric_scooter_app/screen/auth/auth_view_model.dart';
import 'package:electric_scooter_app/screen/auth/register_screen.dart';
import 'package:electric_scooter_app/screen/cart/cart_screen.dart';
import 'package:electric_scooter_app/screen/cart/cart_view_model.dart';
import 'package:electric_scooter_app/screen/history/history_view_model.dart';
import 'package:electric_scooter_app/screen/home/product_view_model.dart';
import 'package:electric_scooter_app/screen/main_screen.dart';
import 'package:electric_scooter_app/screen/home/search_product_screen.dart';
import 'package:electric_scooter_app/screen/profile/profile_screen.dart';
import 'package:electric_scooter_app/screen/profile/profile_view_model.dart';
import 'package:electric_scooter_app/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screen/auth/login_screen.dart';
import 'package:provider/provider.dart';

import 'screen/checkout_success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: const Color(0xFFfdfcfa),
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/home': (context) => const MainScreen(),
          '/searchProduct': (context) => const SearchProductScreen(),
          '/cart': (context) => const CartScreen(),
          '/success_checkout': (context) => const CheckoutSuccessScreen(),
        },
      ),
    );
  }
}
