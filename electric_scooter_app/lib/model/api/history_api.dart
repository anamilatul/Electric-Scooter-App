import 'dart:convert';
import 'package:electric_scooter_app/model/history_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_pref_profile_model.dart';

class HistoryAPI {
  String ipAddress = "192.168.8.114";
  Future<List<HistoryOrderModel>> getHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userID = sharedPreferences.getString(PrefProfile.idUSer).toString();
    List<HistoryOrderModel> listHistory = [];
    var getHistoryUrl =
        Uri.parse("http://$ipAddress/escoot/get_history.php?id_user=$userID");
    final response = await http.get(getHistoryUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => HistoryOrderModel.fromJson(json)).toList();
    }
    return listHistory;
  }
}
