// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../model/product_model.dart';
import '../cart/cart_view_model.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductModel productModel;
  DetailProductScreen(this.productModel);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final priceFormat = NumberFormat("#,##0", "EN_US");
  @override
  void initState() {
    super.initState();
    Provider.of<CartViewModel>(context, listen: false).getPref();
  }

  @override
  Widget build(BuildContext context) {
    final modelCart = Provider.of<CartViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Detail Product',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                color: Colors.white,
                height: 300,
                child: Image.network(
                  widget.productModel.imageProduct,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.nameProduct,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Description : ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.productModel.descriptionProduct,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 72, 71, 71),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Rp. " +
                              priceFormat.format(
                                int.parse(widget.productModel.price),
                              ),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final result =
                      modelCart.addToCart(widget.productModel.idProduct);
                  if (result != null) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Information"),
                              content: const Text('Successfully add to cart'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/home', (route) => false);
                                    },
                                    child: const Text("Oke"))
                              ],
                            ));
                    setState(() {});
                  } else {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Information"),
                              content: const Text('Sorry, add to cart failed'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Oke"))
                              ],
                            ));
                    setState(() {});
                  }
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
