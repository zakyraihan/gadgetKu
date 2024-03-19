import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';
import 'package:gadgetku/model/produk.dart';
import 'package:gadgetku/ui/homepage/home_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      // Image.asset('assets/img/logo.png', height: 45)
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            alwaysShowMiddle: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell),
            ),
            largeTitle: const Text('Discover'),
            trailing: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart-page'),
              icon: const Icon(CupertinoIcons.cart),
            ),
            transitionBetweenRoutes: true,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  // _buildCarousel(),

                  const SizedBox(
                      height: 16), // Adjust the space according to your needs

                  JudulWidget(title: 'Categories', onPressed: () => ()),
                  KategoriWidget(text: 'text'),

                  const SizedBox(height: 15),

                  JudulWidget(title: 'Products', onPressed: () => ()),
                  // Wrap(
                  //   spacing: 15,
                  //   runSpacing: 15,
                  //   children: List.generate(
                  //     10,
                  //     (index) => GestureDetector(
                  //       onTap: () =>
                  //           Navigator.pushNamed(context, '/detail-page'),
                  //       child: ProdukWidget(
                  //         produk: dataProduk[index],
                  //       ),
                  //     ),
                  //   ),
                  // ),
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

                // _buildCarousel(),

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

                // FutureBuilder(
                //   future: HomeController().getProduk(),
                //   builder: (context, snapshot) {
                //     List<ProdukList> data = snapshot.data;
                //     return Wrap(
                //       spacing: 15,
                //       runSpacing: 15,
                //       children: List.generate(
                //         10,
                //         (index) => ProdukWidget(
                //           produk: data[index],
                //         ),
                //       ),
                //     );
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CarouselSlider _buildCarousel() {
  //   return CarouselSlider(
  //     items: banner.map((e) => Image.asset(e)).toList(),
  //     options: CarouselOptions(
  //       autoPlay: true,
  //       disableCenter: true,
  //       onPageChanged: (index, reason) {
  //         setState(() {
  //           _currentIndex = index;
  //         });
  //       },
  //       // Properti untuk dots (indikator)
  //       height: 200.0,
  //       aspectRatio: 16 / 9,
  //       viewportFraction: 1.0,
  //       enableInfiniteScroll: true,
  //       autoPlayInterval: const Duration(seconds: 3),
  //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
  //       autoPlayCurve: Curves.fastOutSlowIn,
  //     ),
  //   );
  // }
}
