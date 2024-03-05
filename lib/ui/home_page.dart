import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';
import 'package:gadgetku/widget/judul_widget.dart';
import 'package:gadgetku/widget/kategori_widget.dart';
import 'package:gadgetku/widget/platform_widget.dart';
import 'package:gadgetku/widget/produk_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List banner = [
    'assets/home/Group 1.png',
    'assets/home/Rectangle 3.png',
    'assets/home/Group 3.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Action'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Action'),
          ),
        ],
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            alwaysShowMiddle: true,
            leading: Image.asset('assets/img/logo.png', height: 45),
            largeTitle: const Text('Discover'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell),
            ),
            transitionBetweenRoutes: true,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  _buildCarousel(),

                  const SizedBox(
                      height: 16), // Adjust the space according to your needs

                  JudulWidget(
                      title: 'Categories',
                      onPressed: () => _showActionSheet(context)),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      children: List.generate(
                        5,
                        (index) => KategoriWidget(
                          text: 'Smartphone',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(
                      10,
                      (index) => GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/detail-page'),
                        child: ProdukWidget(
                            namaProduk: 'iphone 15 pro max',
                            gambarProduk: 'assets/home/produk-test.png',
                            rating: '4.5',
                            hargaProduk: '20.000.000'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, Zaky',
                      style: poppins(20, FontWeight.w500, Colors.black),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.trolley,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                _buildCarousel(),

                const SizedBox(
                    height: 16), // Adjust the space according to your needs

                JudulWidget(title: 'Categories', onPressed: () {}),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10,
                    children: List.generate(
                      5,
                      (index) => KategoriWidget(
                        text: 'Smartphone',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    10,
                    (index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/detail-page'),
                      child: ProdukWidget(
                          namaProduk: 'iphone 15 pro max',
                          gambarProduk: 'assets/home/produk-test.png',
                          rating: '4.5',
                          hargaProduk: '20.000.000'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider _buildCarousel() {
    return CarouselSlider(
      items: banner.map((e) => Image.asset(e)).toList(),
      options: CarouselOptions(
        autoPlay: true,
        disableCenter: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Properti untuk dots (indikator)
        height: 200.0,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
