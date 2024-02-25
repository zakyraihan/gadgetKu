import 'package:flutter/material.dart';
import 'package:gadgetku/common/splash_screen/splash_screen.dart';
import 'package:gadgetku/ui/detail%20page/detail_page.dart';
import 'package:gadgetku/ui/home.dart';
import 'package:gadgetku/ui/register%20page/register_page.dart';

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
          return MaterialApp(
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
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
