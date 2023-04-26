// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatelessWidget {
  final String imageProduct;
  final String nameProduct;
  final String price;
  const CardProduct({
    Key? key,
    required this.imageProduct,
    required this.nameProduct,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat("#,##0", "EN_US");
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageProduct,
            width: 115,
            height: 76,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nameProduct,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Rp. " +
                priceFormat.format(
                  int.parse(price),
                ),
          ),
        ],
      ),
    );
  }
}
