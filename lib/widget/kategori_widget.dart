// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class KategoriWidget extends StatelessWidget {
  KategoriWidget({
    super.key,
    required this.text,
    //  this.image,
  });

  String text;
  // String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Image.asset(image ?? ''),
          // SizedBox(width: 3),
          Text(
            text,
            style: poppins(15, FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
