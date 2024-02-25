// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget {
  KategoriWidget({super.key, required this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }
}
