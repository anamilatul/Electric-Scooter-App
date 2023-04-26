import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';

class AuthProvider with ChangeNotifier {
  final UserAPI _userAPI = UserAPI();
  Future registUser(String fullname, String email, String phone, String address,
      String password) async {
    await _userAPI.registUser(
        fullname: fullname,
        email: email,
        phone: phone,
        address: address,
        password: password);
    notifyListeners();
  }

  Future loginUser(String fullname, String email, String password) async {
    await _userAPI.loginUser(
        fullname: fullname, email: email, password: password);
    notifyListeners();
  }
}
