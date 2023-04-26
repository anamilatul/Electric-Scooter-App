// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCategory {
  final String idCategory;
  final String category;
  final String image;
  String status;
  List<ProductModel> product;
  ProductCategory({
    required this.idCategory,
    required this.category,
    required this.image,
    required this.status,
    required this.product,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> dataProduct) {
    var list = dataProduct['product'] as List;
    List<ProductModel> listProduct =
        list.map((e) => ProductModel.fromJson(e)).toList();
    return ProductCategory(
        idCategory: dataProduct['id_category'],
        category: dataProduct['category'],
        image: dataProduct['image'],
        status: dataProduct['status'],
        product: listProduct);
  }
}

class ProductModel {
  final String idProduct;
  final String idCategory;
  final String nameProduct;
  final String descriptionProduct;
  final String imageProduct;
  final String price;
  final String status;
  final String createdAt;

  ProductModel({
    required this.idProduct,
    required this.idCategory,
    required this.nameProduct,
    required this.descriptionProduct,
    required this.imageProduct,
    required this.price,
    required this.status,
    required this.createdAt,
  });
  factory ProductModel.fromJson(Map<String, dynamic> dataProduct) {
    return ProductModel(
      idProduct: dataProduct['id_product'],
      idCategory: dataProduct['id_category'],
      nameProduct: dataProduct['name'],
      descriptionProduct: dataProduct['description'],
      imageProduct: dataProduct['image'],
      price: dataProduct['price'],
      status: dataProduct['status'],
      createdAt: dataProduct['created_at'],
    );
  }
}
