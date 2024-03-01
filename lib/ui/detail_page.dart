import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade200,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: const DecorationImage(
                  image: AssetImage('assets/home/produk-test.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                height: 360,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
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
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(
                            5,
                            (index) => Container(
                              width: 90,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 6),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text('1TB'),
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
      ),
    );
  }
}
