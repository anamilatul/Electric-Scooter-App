import 'package:electric_scooter_app/model/api/cart_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cart_model.dart';
import '../../model/shared_pref_profile_model.dart';

class CartViewModel with ChangeNotifier {
  String userID = "";
  String fullname = "";
  String phone = "";
  String address = "";

  String _sumPrice = "0";
  String get sumPrice => _sumPrice;

  int _totalPayment = 0;
  int _delivery = 0;
  int get totalPayment => _totalPayment;

  List<CartModel> _listProductCart = [];
  List<CartModel> get listProductCart => _listProductCart;

  Future<void> getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userID = sharedPreferences.getString(PrefProfile.idUSer).toString();
    fullname = sharedPreferences.getString(PrefProfile.name).toString();
    phone = sharedPreferences.getString(PrefProfile.phone).toString();
    address = sharedPreferences.getString(PrefProfile.address).toString();
    getCart();
    getCartTotalPrice();
    notifyListeners();
  }

  Future<void> addToCart(String productId) async {
    final response =
        await CartAPI().addToCart(userId: userID, productId: productId);
    int value = response['value'];
    String message = response['message'];
    if (value == 1) {
      print('value = $value \n message = $message');
    } else {
      print('value = $value \n message = $message');
    }
    notifyListeners();
  }

  Future<List<CartModel>> getCart() async {
    _listProductCart.clear();
    if (_listProductCart.isEmpty) {
      try {
        _listProductCart = await CartAPI().getCart();
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
    return _listProductCart;
  }

  Future<void> updateQuantity(String type, String model) async {
    final response = await CartAPI().updateQuantity(type, model);
    int value = response['value'];
    String message = response['message'];
    if (value == 1) {
      print('value = $value \n message = $message');
    } else {
      print('value = $value \n message = $message');
    }
    getPref();
    notifyListeners();
  }

  void getCartTotalPrice() async {
    try {
      _sumPrice = await CartAPI().getCartTotalPrice() ?? '0';
      _totalPayment = int.parse(_sumPrice) + _delivery;
    } catch (e) {
      print(e.toString());
      _sumPrice = '0';
      _totalPayment = 0;
    }
    // totalPayment = sumPrice == null ? 0 : int.parse(sumPrice) + delivery;
    notifyListeners();
  }
}
