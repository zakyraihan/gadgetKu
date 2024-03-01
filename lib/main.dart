import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/ui/detail_page.dart';
import 'package:gadgetku/ui/home.dart';
import 'package:gadgetku/ui/home_page.dart';
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
                  routes: {
                    '/splash-screen': (context) => const SplashScreen(),
                    '/home': (context) => const Home(),
                    '/register-page': (context) => const RegisterPage(),
                    '/detail-page': (context) => const DetailPage(),
                  },
                )
              : CupertinoApp(
                  title: 'GadgetKu',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/home',
                  onGenerateRoute: (settings) {
                    switch (settings.name) {
                      case '/splash-screen':
                        return CupertinoPageRoute(
                          builder: (context) => const SplashScreen(),
                        );
                      case '/home':
                        return CupertinoPageRoute(
                          builder: (context) => const Home(),
                        );
                      case '/register-page':
                        return CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        );
                      case '/detail-page':
                        return CupertinoPageRoute(
                          builder: (context) => const DetailPage(),
                        );
                      default:
                        // Handle unknown routes
                        return CupertinoPageRoute(
                          builder: (context) => const HomePage(),
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
