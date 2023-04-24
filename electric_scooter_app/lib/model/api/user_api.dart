import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class UserAPI {
  String ipAddress = "192.168.0.102";

  Future loginUser({
    required String fullname,
    required String email,
    required String password,
  }) async {
    try {
      var loginUrl = Uri.parse("http://$ipAddress/escoot/login_api.php");
      final response = await http.post(loginUrl, body: {
        'fullname': fullname,
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        final user = User.fromJson(responseData);
        return user;
      }
      debugPrint(response.body.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future registUser({
    required String fullname,
    required String email,
    required String phone,
    required String address,
    required String password,
  }) async {
    try {
      var registUrl = Uri.parse("http://$ipAddress/escoot/register_api.php");
      final response = await http.post(
        registUrl,
        body: {
          'fullname': fullname,
          'email': email,
          'phone': phone,
          'address': address,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final user = User.fromJson(responseData);
        return user;
      }
      debugPrint(response.body.toString());
    } catch (e) {
      rethrow;
    }
  }
}
