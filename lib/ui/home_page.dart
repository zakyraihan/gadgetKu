import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/api/toko_service.dart';
import 'package:gadgetku/common/textstyle.dart';
import 'package:gadgetku/model/model.dart';
import 'package:gadgetku/widget/judul_widget.dart';
import 'package:gadgetku/widget/kategori_widget.dart';
import 'package:gadgetku/widget/platform_widget.dart';
import 'package:gadgetku/widget/produk_widget.dart';
import 'package:gadgetku/widget/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoryId = '';
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
                  const SizedBox(height: 16),
                  JudulWidget(title: 'Categories', onPressed: () => ()),
                  FutureBuilder(
                    future: ApiService().getKategori(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Kategori> data = snapshot.data;

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: List.generate(
                              data.length,
                              (index) => KategoriWidget(
                                image: data[index].image,
                                title: data[index].name,
                                onTap: () {
                                  print('${data[index].id}');
                                  setState(() {
                                    categoryId = data[index].id.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      } else {
                        return buildShimmer(context);
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  JudulWidget(
                    title: 'Products',
                    onPressed: () => Navigator.pushNamed(context, '/allproduk'),
                  ),
                  FutureBuilder(
                    future: ApiService().getProduk(categoryId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Produk> data = snapshot.data;

                        return Wrap(
                          spacing: 10,
                          children: List.generate(
                            data.length,
                            (index) => GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/detail-page',
                                arguments: data[index],
                              ),
                              child: ProdukWidget(
                                namaProduk: data[index].title,
                                gambarProduk: data[index].images,
                                rating: data[index].id,
                                hargaProduk: data[index].price.toDouble(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
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

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Wrap(
                //     spacing: 10,
                //     children: List.generate(
                //       5,
                //       (index) => const KategoriWidget(),
                //     ),
                //   ),
                // ),

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
}
