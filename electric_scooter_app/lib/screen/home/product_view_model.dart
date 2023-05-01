import 'package:electric_scooter_app/model/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/product_model.dart';
import '../../model/shared_pref_profile_model.dart';

class ProductViewModel with ChangeNotifier {
  List<ProductCategory> _categories = [];
  List<ProductCategory> get categories => _categories;

  List<ProductModel> _listProduct = [];
  List<ProductModel> get listProduct => _listProduct;

  List<ProductModel> _listSearch = [];
  List<ProductModel> get listSearch => _listSearch;
  String fullname = "";

  Future<List<ProductCategory>> getCategories() async {
    _categories.clear();
    if (_categories.isEmpty) {
      try {
        _categories = await ProductAPI().getCategories();
        getProduct();
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
    return _categories;
  }

  Future<List<ProductModel>> getProduct() async {
    _listProduct.clear();
    if (_listProduct.isEmpty) {
      try {
        _listProduct = await ProductAPI().getProduct();
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
    return _listProduct;
  }

  searchroduct(String text) async {
    _listSearch.clear();
    if (text.isNotEmpty) {
      _listProduct.forEach((element) {
        if (element.nameProduct.toLowerCase().contains(text)) {
          listSearch.add(element);
        }
      });
    } else {}
  }

  Future<void> getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fullname = sharedPreferences.getString(PrefProfile.name).toString();
    notifyListeners();
  }
}
