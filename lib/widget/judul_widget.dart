// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class JudulWidget extends StatelessWidget {
  JudulWidget({super.key, required this.title, required this.onPressed});

  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: poppins(20, FontWeight.w500, Colors.black),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See all',
            style: poppins(15, FontWeight.w500, Colors.blue),
          ),
        ),
      ],
    );
  }
}
