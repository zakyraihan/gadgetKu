// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class ProdukWidget extends StatefulWidget {
  ProdukWidget(
      {super.key,
      required this.namaProduk,
      required this.gambarProduk,
      required this.rating,
      required this.hargaProduk});

  String namaProduk;
  String gambarProduk;
  String rating;
  String hargaProduk;

  @override
  State<ProdukWidget> createState() => _ProdukWidgetState();
}

class _ProdukWidgetState extends State<ProdukWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-page');
      },
      child: SizedBox(
        // padding: const EdgeInsets.only(bottom: 40),
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.gambarProduk),
                ),
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(right: 5, top: 5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 95, // Adjusted width for the Text widget
                  child: Text(
                    widget.namaProduk,
                    overflow: TextOverflow.ellipsis,
                    style: poppins(
                      13,
                      FontWeight.w400,
                      Colors.grey.shade600,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow.shade600,
                    ),
                    Text(
                      widget.rating,
                      style: roboto(
                        15,
                        FontWeight.w500,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Rp ${widget.hargaProduk}',
              style: poppins(15, FontWeight.w600, Colors.grey.shade900),
            ),
          ],
        ),
      ),
    );
  }
}