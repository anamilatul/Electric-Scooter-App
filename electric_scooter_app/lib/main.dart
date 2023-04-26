import 'package:electric_scooter_app/screen/auth/auth_view_model.dart';
import 'package:electric_scooter_app/screen/auth/register_screen.dart';
import 'package:electric_scooter_app/screen/product_view_model.dart';
import 'package:electric_scooter_app/screen/main_screen.dart';
import 'package:electric_scooter_app/screen/search_product_view.dart';
import 'package:electric_scooter_app/screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'screen/auth/login_screen.dart';
import 'package:provider/provider.dart';

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
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashView(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const MainScreen(),
          '/searchProduct': (context) => const SearchProductView(),
        },
      ),
    );
  }
}
