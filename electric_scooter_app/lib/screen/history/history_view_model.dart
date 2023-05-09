import 'package:electric_scooter_app/model/api/history_api.dart';
import 'package:electric_scooter_app/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/shared_pref_profile_model.dart';

class HistoryViewModel with ChangeNotifier {
  List<HistoryOrderModel> _listHistory = [];
  List<HistoryOrderModel> get listHistory => _listHistory;
  String userID = "";

  Future<List<HistoryOrderModel>> getHistory() async {
    _listHistory.clear();
    if (_listHistory.isEmpty) {
      try {
        _listHistory = await HistoryAPI().getHistory();

        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
    return _listHistory;
  }

  Future<void> getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userID = sharedPreferences.getString(PrefProfile.idUSer).toString();
    debugPrint(userID);
    getHistory();
    notifyListeners();
  }
}
