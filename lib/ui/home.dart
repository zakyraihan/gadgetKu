import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/ui/favorite_page.dart';
import 'package:gadgetku/ui/home_page.dart';
import 'package:gadgetku/ui/search_page.dart';
import 'package:gadgetku/ui/settings_page.dart';
import 'package:gadgetku/widget/platform_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.search : Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.heart : Icons.favorite),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  final List<Widget> _listWidget = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          tabBackgroundColor: Colors.black,
          activeColor: Colors.white,
          padding: const EdgeInsets.all(10),
          gap: 8,
          onTabChange: (value) {
            setState(() {
              _bottomNavIndex = value;
            });
          },
          tabs: const [
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.near_me, text: "Booking"),
            GButton(icon: Icons.favorite, text: "Favorit"),
            GButton(icon: Icons.person, text: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: _bottomNavItems),
        tabBuilder: (context, index) {
          return _listWidget[index];
        },
      ),
    );
  }
}
