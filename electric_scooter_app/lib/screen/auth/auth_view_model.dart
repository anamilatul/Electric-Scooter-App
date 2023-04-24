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

  // getPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   fullname = prefs.getString(PrefProfile.name);
  //   createdDate = prefs.getString(PrefProfile.createdAt);
  //   phone = prefs.getString(PrefProfile.phone);
  //   email = prefs.getString(PrefProfile.email);
  //   address = prefs.getString(PrefProfile.address);
  // }

  // Future isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString('email');
  //   return email != null;
  // }

  // signOut() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(PrefProfile.idUSer);
  //   prefs.remove(PrefProfile.name);
  //   prefs.remove(PrefProfile.email);
  //   prefs.remove(PrefProfile.phone);
  //   prefs.remove(PrefProfile.address);
  //   prefs.remove(PrefProfile.cretedAt);
  //   notifyListeners();

  // Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPages()),
  //     (route) => false);
}
