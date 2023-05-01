import 'package:carousel_slider/carousel_slider.dart';
import 'package:electric_scooter_app/screen/widget/card_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_product_screen.dart';
import 'product_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool filtering = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductViewModel>(context, listen: false).getCategories();
    Provider.of<ProductViewModel>(context, listen: false).getPref();
  }

  static final List<String> imgSlider = [
    'slide1.jpg',
    'slide2.jpg',
    'slide3.jpg',
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
      items: imgSlider.map((fileImage) {
        return Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              'assets/images/${fileImage}',
              width: 10000,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 230,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ));

  @override
  Widget build(BuildContext context) {
    final modelCategory = Provider.of<ProductViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo_skuter.png',
                      width: 70,
                      height: 50,
                      color: Colors.amber,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hi, ${modelCategory.fullname}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Welcome to Electric Scooter Store, \nFind the best electric scooter here !',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/searchProduct');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 250, 244, 227),
                ),
                child: const TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                    hintText: "Search Electric Scooter",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: autoPlayImage,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Electric Scooter Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: modelCategory.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                final category = modelCategory.categories[i];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = i;
                      filtering = true;
                      print("$index,$filtering");
                    });
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          category.image,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(category.category),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Product',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            filtering
                ? index == 7
                    ? const Text('OnProgress')
                    : GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount:
                            modelCategory.categories[index].product.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, i) {
                          final y = modelCategory.categories[index].product[i];
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
                        })
                : GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: modelCategory.listProduct.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, i) {
                      final y = modelCategory.listProduct[i];
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
          ],
        ),
      ),
    );
  }
}
