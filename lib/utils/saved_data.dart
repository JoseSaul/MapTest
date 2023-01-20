import 'dart:convert';

import 'package:map_test/model/save_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<List<SaveDataModel>> getSavedData() async {
    final shared = await SharedPreferences.getInstance();
    List<SaveDataModel> list = [];
    List<String> encodedList = shared.getStringList('history') ?? [];
    for (var element in encodedList) {
      list.add(SaveDataModel.fromJson(jsonDecode(element)));
    }

    return list;
  }

  static Future<void> addSaveData(SaveDataModel value) async {
    final shared = await SharedPreferences.getInstance();
    List<SaveDataModel> list = await getSavedData();
    list.add(value);
    List<String> encodedList = [];
    for (var element in list){
      encodedList.add(jsonEncode(element));
    }
    await shared.setStringList('history', encodedList);
  }
}