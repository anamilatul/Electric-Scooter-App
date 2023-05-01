import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../cart_model.dart';
import '../shared_pref_profile_model.dart';

class CartAPI {
  String ipAddress = "192.168.0.108";

  Future<Map<String, dynamic>> addToCart({
    required String userId,
    required String productId,
  }) async {
    var addToCartUrl = Uri.parse("http://$ipAddress/escoot/add_cart.php");
    final response = await http.post(addToCartUrl, body: {
      "id_user": userId,
      "id_product": productId,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      return {"value": value, "message": message};
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<CartModel>> getCart() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userID = sharedPreferences.getString(PrefProfile.idUSer).toString();
    List<CartModel> listCart = [];
    var getCartUrl =
        Uri.parse("http://$ipAddress/escoot/get_cart.php?userID=" + userID);
    final response = await http.get(getCartUrl);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (Map item in data) {
        listCart.add(CartModel.fromJson(item));
      }
    }
    return listCart;
  }

  Future updateQuantity(String type, String model) async {
    var updateQuantityUrl =
        Uri.parse("http://$ipAddress/escoot/update_quantity.php");
    final response = await http.post(updateQuantityUrl, body: {
      "idCart": model,
      "type": type,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      return {"value": value, "message": message};
    } else {
      throw Exception('Failed to Update Quantity');
    }
  }

  Future getCartTotalPrice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userID = sharedPreferences.getString(PrefProfile.idUSer).toString();
    var sumPrice = "0";
    var getCartTotalPriceUrl = Uri.parse(
        "http://$ipAddress/escoot/get_total_price.php?userID=" + userID);
    final response = await http.get(getCartTotalPriceUrl);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String total_price = data['total_price'];
      sumPrice = total_price;
      print(sumPrice);
    }
    return sumPrice;
  }
}
