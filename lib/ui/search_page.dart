// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gadgetku/common/textstyle.dart';
// import 'package:gadgetku/widget/judul_widget.dart';
// import 'package:gadgetku/widget/kategori_widget.dart';
// import 'package:gadgetku/widget/platform_widget.dart';
// import 'package:gadgetku/widget/produk_widget.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   bool isSearch = false;
//   @override
//   Widget build(BuildContext context) {
//     return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
//   }

//   Widget _buildIos(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: [
//           CupertinoSliverNavigationBar(
//             alwaysShowMiddle: true,
//             leading: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: const Icon(CupertinoIcons.back),
//             ),
//             largeTitle: isSearch
//                 ? CupertinoSearchTextField(
//                     onChanged: (value) {},
//                   )
//                 : const Text('Search'),
//             trailing: IconButton(
//               onPressed: () {
//                 setState(() {
//                   isSearch = !isSearch;
//                 });
//               },
//               icon: const Icon(CupertinoIcons.search),
//             ),
//             transitionBetweenRoutes: true,
//           ),
//           SliverToBoxAdapter(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 15),
//                   Wrap(
//                     spacing: 15,
//                     runSpacing: 15,
//                     children: List.generate(
//                       30,
//                       (index) => GestureDetector(
//                         onTap: () =>
//                             Navigator.pushNamed(context, '/detail-page'),
//                         child: ProdukWidget(
//                           namaProduk: 'iphone 15 pro max',
//                           gambarProduk: 'assets/home/produk-test.png',
//                           rating: '4.5',
//                           hargaProduk: '15.000.000',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAndroid(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Hello, Zaky',
//                       style: poppins(20, FontWeight.w500, Colors.black),
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.grey.shade200,
//                       child: const Icon(
//                         Icons.trolley,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ],
//                 ),

//                 // _buildCarousel(),

//                 const SizedBox(
//                     height: 16), // Adjust the space according to your needs

//                 JudulWidget(title: 'Categories', onPressed: () {}),

//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Wrap(
//                     spacing: 10,
//                     children: List.generate(
//                       5,
//                       (index) => const KategoriWidget(),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // FutureBuilder(
//                 //   future: HomeController().getProduk(),
//                 //   builder: (context, snapshot) {
//                 //     List<ProdukList> data = snapshot.data;
//                 //     return Wrap(
//                 //       spacing: 15,
//                 //       runSpacing: 15,
//                 //       children: List.generate(
//                 //         10,
//                 //         (index) => ProdukWidget(
//                 //           produk: data[index],
//                 //         ),
//                 //       ),
//                 //     );
//                 //   },
//                 // )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
