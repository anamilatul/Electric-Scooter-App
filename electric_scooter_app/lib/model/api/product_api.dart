import 'dart:convert';
import 'package:http/http.dart' as http;
import '../product_model.dart';

class ProductAPI {
  String ipAddress = "192.168.8.114";
  Future<List<ProductCategory>> getCategories() async {
    var categoryUrl =
        Uri.parse("http://$ipAddress/escoot/get_product_by_category.php");
    final response = await http.get(categoryUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<ProductModel>> getProduct() async {
    var productUrl = Uri.parse("http://$ipAddress/escoot/get_all_product.php");
    final response = await http.get(productUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }
}
