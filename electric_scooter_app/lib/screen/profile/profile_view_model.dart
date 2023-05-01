import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/shared_pref_profile_model.dart';

class ProfileViewModel with ChangeNotifier {
  String fullname = "";
  String createdDate = "";
  String phone = "";
  String email = "";
  String address = "";

  Future getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fullname = sharedPreferences.getString(PrefProfile.name).toString();
    createdDate = sharedPreferences.getString(PrefProfile.createdAt).toString();
    phone = sharedPreferences.getString(PrefProfile.phone).toString();
    email = sharedPreferences.getString(PrefProfile.email).toString();
    address = sharedPreferences.getString(PrefProfile.address).toString();
  }

  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefProfile.idUSer);
    sharedPreferences.remove(PrefProfile.name);
    sharedPreferences.remove(PrefProfile.email);
    sharedPreferences.remove(PrefProfile.phone);
    sharedPreferences.remove(PrefProfile.address);
    sharedPreferences.remove(PrefProfile.createdAt);
  }
}
