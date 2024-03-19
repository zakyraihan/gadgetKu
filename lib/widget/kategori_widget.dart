// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gadgetku/data/common/textstyle.dart';
import 'package:gadgetku/data/model/model.dart';

class KategoriWidget extends StatefulWidget {
  KategoriWidget({
    super.key,
    required this.kategori,
    //  this.image,
  });

  final KategoriList kategori;

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  int _selectedIndex = 0;
  // String? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10,
        children: List.generate(
          10,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _selectedIndex == index
                          ? Colors.blue
                          : Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Image.asset(image ?? ''),
                    // SizedBox(width: 3),
                    Text(
                      widget.kategori.namaKategori,
                      style: poppins(15, FontWeight.normal),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
