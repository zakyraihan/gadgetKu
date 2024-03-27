import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/ui/all_product.dart';
import 'package:gadgetku/ui/cart_page.dart';
import 'package:gadgetku/ui/detail_page.dart';
import 'package:gadgetku/ui/forgot_password_page.dart';
import 'package:gadgetku/ui/home.dart';
import 'package:gadgetku/ui/login_page.dart';
import 'package:gadgetku/ui/notfoundpage.dart';
import 'package:gadgetku/ui/onboarding_screen.dart';
import 'package:gadgetku/ui/register_page.dart';
import 'package:gadgetku/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Platform.isAndroid
              ? MaterialApp(
                  theme: ThemeData.light(),
                  title: 'belanjaAja',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {
                    '/onboarding-screen': (context) => const OnBoardingScreen(),
                    '/splash-screen': (context) => const SplashScreen(),
                    '/register-page': (context) => const RegisterPage(),
                    '/login-page': (context) => const LoginPage(),
                    '/forgotpassword-page': (context) =>
                        const ForgotPasswordPage(),
                    '/': (context) => const Home(),
                    '/detail-page': (context) => const DetailPage(),
                    '/not-found': (context) => const NotFoundPage(),
                  },
                )
              : CupertinoApp(
                  title: 'belanjaAja',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {
                    '/onboarding-screen': (context) => const OnBoardingScreen(),
                    '/splash-screen': (context) => const SplashScreen(),
                    '/register-page': (context) => const RegisterPage(),
                    '/login-page': (context) => const LoginPage(),
                    '/forgotpassword-page': (context) =>
                        const ForgotPasswordPage(),
                    '/': (context) => const Home(),
                    '/detail-page': (context) => const DetailPage(),
                    '/cart-page': (context) => const CartPage(),
                    // '/search-page': (context) => const SearchPage(),
                    '/allproduk': (context) => const AllProdukPage(),
                    '/not-found': (context) => const NotFoundPage(),
                  },
                );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
