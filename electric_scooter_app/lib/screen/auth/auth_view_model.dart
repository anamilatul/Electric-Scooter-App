import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';

class AuthViewModel with ChangeNotifier {
  final UserAPI _userAPI = UserAPI();
  Future registUser(BuildContext context, String fullname, String email,
      String phone, String address, String password) async {
    await _userAPI.registUser(context,
        fullname: fullname,
        email: email,
        phone: phone,
        address: address,
        password: password);
    notifyListeners();
  }

  Future loginUser(BuildContext context, String fullname, String email,
      String password) async {
    await _userAPI.loginUser(context,
        fullname: fullname, email: email, password: password);
    notifyListeners();
  }
}
