import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';
import 'package:gadgetku/widget/judul_widget.dart';
import 'package:gadgetku/widget/kategori_widget.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // discover / cart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, Zaky 😊',
                      style: poppins(20, FontWeight.w500, Colors.black),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.trolley,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                // discover / cart

                // search bar
                // Container(
                //   padding: const EdgeInsets.only(top: 30, bottom: 30),
                //   child: const TextField(
                //     decoration: InputDecoration(
                //       suffixIcon: Icon(Icons.search, size: 30),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(15),
                //         ),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(15)),
                //         borderSide: BorderSide(
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // search bar

                // banner carousel
                _buildCarousel(),
                // banner carousel

                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: banner.map((url) {
                    int index = banner.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentIndex == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                    );
                  }).toList(),
                ),
                // banner carousel

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

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    runAlignment: WrapAlignment.start,
                    children: [
                      ProdukWidget(
                        namaProduk: 'Iphone 15 pro max',
                        gambarProduk: 'assets/home/produk-test.png',
                        rating: '4.5',
                        hargaProduk: '23.000.000',
                      ),
                      ProdukWidget(
                        namaProduk: 'Iphone 15 pro',
                        gambarProduk: 'assets/home/produk-test.png',
                        rating: '5.0',
                        hargaProduk: '18.500.000',
                      ),
                      ProdukWidget(
                        namaProduk: 'Iphone 15 ',
                        gambarProduk: 'assets/home/produk-test.png',
                        rating: '7.5',
                        hargaProduk: '15.300.000',
                      ),
                      ProdukWidget(
                        namaProduk: 'Samsung s24',
                        gambarProduk: 'assets/home/produk-test.png',
                        rating: '6.5',
                        hargaProduk: '13.300.000',
                      ),
                    ],
                  ),
                ),
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
