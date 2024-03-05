import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Platform.isAndroid
              ? MaterialApp(
                  theme: ThemeData.light(),
                  title: 'GadgetKu',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/home',
                  onGenerateRoute: (settings) {
                    switch (settings.name) {
                      case '/splash-screen':
                        return MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        );
                      case '/register-page':
                        return CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        );
                      case '/login-page':
                        return MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        );
                      case '/forgotpassword-page':
                        return CupertinoPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        );
                      case '/home':
                        return MaterialPageRoute(
                          builder: (context) => const Home(),
                        );
                      case '/detail-page':
                        return MaterialPageRoute(
                          builder: (context) => const DetailPage(),
                        );
                      default:
                        // ketika halaman tidak ada
                        return MaterialPageRoute(
                          builder: (context) => const NotFoundPage(),
                        );
                    }
                  },
                )
              : CupertinoApp(
                  title: 'GadgetKu',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/onboarding-screen',
                  onGenerateRoute: (settings) {
                    switch (settings.name) {
                      case '/onboarding-screen':
                        return CupertinoPageRoute(
                          builder: (context) => const OnBoardingScreen(),
                        );
                      case '/splash-screen':
                        return CupertinoPageRoute(
                          builder: (context) => const SplashScreen(),
                        );
                      case '/register-page':
                        return CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        );
                      case '/login-page':
                        return CupertinoPageRoute(
                          builder: (context) => const LoginPage(),
                        );
                      case '/forgotpassword-page':
                        return CupertinoPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        );
                      case '/home':
                        return CupertinoPageRoute(
                          builder: (context) => const Home(),
                        );
                      case '/detail-page':
                        return CupertinoPageRoute(
                          builder: (context) => const DetailPage(),
                        );
                      default:
                        // ketika halaman tidak ada
                        return CupertinoPageRoute(
                          builder: (context) => const NotFoundPage(),
                        );
                    }
                  },
                );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
