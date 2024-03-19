import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/data/common/textstyle.dart';
import 'package:gadgetku/widget/platform_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = true;

  int _selectedIndex = -1;

  List image = [
    'assets/home/produk-test.png',
    'assets/home/produk-test.png',
    'assets/home/produk-test.png',
  ];

  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 2) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade200,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: image.length,
                controller: _pageController,
                itemBuilder: (context, index) => Image.asset(image[index])),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Iphone 15 pro max',
                            style: poppins(20, FontWeight.w500, Colors.black),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.discount,
                                  color: Colors.white,
                                ),
                                Text(
                                  'On Sale',
                                  style: poppins(
                                      16, FontWeight.normal, Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 6),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow.shade600),
                                  const SizedBox(width: 5),
                                  const Text('4.5')
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text('117 views')
                        ],
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(
                          'Layar iPhone 15 Pro Max memiliki sudut melengkung yang mengikuti desain lekukan yang indah, dan semua sudut ini berada di dalam bidang persegi standar. Jika diukur sebagai bentuk persegi standar, layarnya berukuran 6,69 inci secara diagonal (area bidang layar berukuran lebih kecil).',
                          maxLines: isExpanded ? 5 : 100,
                          overflow: TextOverflow.ellipsis,
                          style: poppins(15, FontWeight.w400, Colors.black),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10,
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6),
                                decoration: BoxDecoration(
                                  border: _selectedIndex == index
                                      ? Border.all(color: Colors.blue)
                                      : Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                  color: _selectedIndex == index
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    '1TB',
                                    style: TextStyle(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return const Scaffold();
  }
}
