import 'package:electric_scooter_app/screen/home/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_product_screen.dart';
import '../widget/card_product.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<ProductViewModel>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final modelCategory = Provider.of<ProductViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 250, 244, 227),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: modelCategory.searchProduct,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.amber,
                        ),
                        hintText: "Search Electric Scooter",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _searchController.text.isEmpty ||
                    modelCategory.listSearch.length == 0
                ? const Center(
                    child: Text('Nothing product to show !'),
                  )
                : Container(
                    padding: const EdgeInsets.all(20),
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: modelCategory.listSearch.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, i) {
                        final y = modelCategory.listSearch[i];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailProductScreen(y)));
                          },
                          child: CardProduct(
                            nameProduct: y.nameProduct,
                            imageProduct: y.imageProduct,
                            price: y.price,
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
