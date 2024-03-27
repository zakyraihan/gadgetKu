// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class KategoriWidget extends StatefulWidget {
  KategoriWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  void Function()? onTap;

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(
                widget.image,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            const SizedBox(width: 3),
            Text(
              widget.title,
              style: poppins(15, FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
