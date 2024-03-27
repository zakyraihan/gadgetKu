import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';

class ProdukWidget extends StatefulWidget {
  ProdukWidget({
    super.key,
    required this.namaProduk,
    required this.gambarProduk,
    required this.rating,
    required this.hargaProduk,
  });

  String namaProduk;
  List<String> gambarProduk;
  int rating;
  double hargaProduk;

  @override
  State<ProdukWidget> createState() => _ProdukWidgetState();
}

class _ProdukWidgetState extends State<ProdukWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.gambarProduk.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 170,
                  height: 170,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      widget.gambarProduk[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 95,
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
                    widget.rating.toString(),
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
    );
  }
}
