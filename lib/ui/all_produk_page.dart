import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/data/common/resultstate.dart';
import 'package:gadgetku/data/common/textstyle.dart';
import 'package:gadgetku/provider/kategori_provider.dart';
import 'package:gadgetku/provider/produk_provider.dart';
import 'package:gadgetku/widget/judul_widget.dart';
import 'package:gadgetku/widget/kategori_widget.dart';
import 'package:gadgetku/widget/platform_widget.dart';
import 'package:gadgetku/widget/produk_widget.dart';
import 'package:provider/provider.dart';

class AllProdukPage extends StatefulWidget {
  const AllProdukPage({super.key});

  @override
  State<AllProdukPage> createState() => _AllProdukPageState();
}

class _AllProdukPageState extends State<AllProdukPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
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
            largeTitle: const Text('All Products'),
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
                  Consumer<KategoriProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (state.state == ResultState.hasData) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              children: List.generate(state.result.data.length,
                                  (index) {
                                var kategori = state.result.data[index];
                                return KategoriWidget(kategori: kategori);
                              }),
                            ),
                          );
                        } else if (state.state == ResultState.noData) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else if (state.state == ResultState.error) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error),
                                Text(state.message),
                              ],
                            ),
                          );
                        } else {
                          return const Scaffold();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Consumer<ProdukProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (state.state == ResultState.hasData) {
                          return SingleChildScrollView(
                            child: Wrap(
                              spacing: 15,
                              runSpacing: 15,
                              children: List.generate(state.result.data.length,
                                  (index) {
                                var produk = state.result.data[index];
                                return ProdukWidget(
                                  produk: produk,
                                );
                              }),
                            ),
                          );
                        } else if (state.state == ResultState.noData) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else if (state.state == ResultState.error) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error),
                                Text(state.message),
                              ],
                            ),
                          );
                        } else {
                          return const Scaffold();
                        }
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

                Consumer<KategoriProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (state.state == ResultState.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            children: List.generate(state.result.data.length,
                                (index) {
                              var kategori = state.result.data[index];
                              return KategoriWidget(kategori: kategori);
                            }),
                          ),
                        );
                      } else if (state.state == ResultState.noData) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else if (state.state == ResultState.error) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error),
                              Text(state.message),
                            ],
                          ),
                        );
                      } else {
                        return const Scaffold();
                      }
                    }
                  },
                ),

                const SizedBox(height: 15),
                JudulWidget(title: 'Products', onPressed: () {}),

                Consumer<ProdukProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (state.state == ResultState.hasData) {
                        return SingleChildScrollView(
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: List.generate(state.result.data.length,
                                (index) {
                              var produk = state.result.data[index];
                              return ProdukWidget(
                                produk: produk,
                              );
                            }),
                          ),
                        );
                      } else if (state.state == ResultState.noData) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else if (state.state == ResultState.error) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error),
                              Text(state.message),
                            ],
                          ),
                        );
                      } else {
                        return const Scaffold();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
