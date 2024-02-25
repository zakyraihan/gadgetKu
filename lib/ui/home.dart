import 'package:flutter/material.dart';
import 'package:gadgetku/ui/favorite_page/favorite_page.dart';
import 'package:gadgetku/ui/home%20page/home_page.dart';
import 'package:gadgetku/ui/search%20page/search_page.dart';
import 'package:gadgetku/ui/settings%20page/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menu = 0;

  List page = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[menu],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            color: Colors.white,
            tabBackgroundColor: Colors.white,
            activeColor: Colors.blue,
            padding: const EdgeInsets.all(10),
            gap: 8,
            onTabChange: (value) {
              setState(() {
                menu = value;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.favorite, text: 'favorite'),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

//  BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         onTap: (value) {
//           setState(() {
//             menu = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'settings'),
//         ],
//       ),

