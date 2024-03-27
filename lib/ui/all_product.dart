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

class AllProdukPage extends StatefulWidget {
  const AllProdukPage({super.key});

  @override
  State<AllProdukPage> createState() => _AllProdukPageState();
}

class _AllProdukPageState extends State<AllProdukPage> {
  // variabel
  TextEditingController title = TextEditingController();
  String categoryId = '';
  int pricemin = 0;
  int pricemax = 0;

  // search
  void onSearchTextChanged(String newText) {
    final query = newText.trim();
    if (query.isNotEmpty) {
      ApiService().getAllProduk(query, '', pricemin, pricemax);
    } else {
      const Text('Pilihan Tidak ada');
    }
    setState(() {});
  }

  // filter
  void showFilterDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoTextField(
                placeholder: 'Minimum Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pricemin = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 10),
              CupertinoTextField(
                placeholder: 'Maximum Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pricemax = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                setState(() {
                  ApiService()
                      .getAllProduk(title.text, categoryId, pricemin, pricemax);
                });
                Navigator.pop(context);
              },
              child: const Text('Filter'),
            ),
          ],
        );
      },
    );
  }

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
              onPressed: () => Navigator.pop(context),
              icon: const Icon(CupertinoIcons.back),
            ),
            largeTitle: const Text('All Products'),
            transitionBetweenRoutes: true,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          controller: title,
                          onChanged: (value) {
                            onSearchTextChanged(value);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showFilterDialog(context);
                        },
                        icon: const Icon(CupertinoIcons.slider_horizontal_3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
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
                  FutureBuilder(
                    future: ApiService().getAllProduk(
                        title.text, categoryId, pricemin, pricemax),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Produk> data = snapshot.data;

                        return Wrap(
                          spacing: 10,
                          runSpacing: 20,
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
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
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
                //             (index) => ProdukWidget(
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
