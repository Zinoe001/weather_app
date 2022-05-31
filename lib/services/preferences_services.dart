import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("getting stored savedData");
    getSearchedList();
    print("gotten stored savedData");
  }

  List<Map<String, dynamic>> searchedList = [];
  static const keySearchedList = "searchedList";

  Future<void> saveSearchedList(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(keySearchedList, jsonEncode(item));
    print(jsonEncode(item));
  }

  Future<void> getSearchedList() async {
    List<Map<String, dynamic>> searched = [];
    searched = jsonDecode(
            _preferences.getString(keySearchedList) ?? <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
    searchedList.addAll(searched);
    print(searchedList);
  }

//    sharedPreferences = getSharedPreferences("shared",MODE_PRIVATE);
//         editor = sharedPreferences.edit();
//         String text = "first text";
//         editor.putString("current",text);
//         if (!sharedPreferences.getString("current","").equals(sharedPreferences.getString("new","")))
//         {
//             editor.putString("new",sharedPreferences.getString("current","") + text );
//             editor.commit();
//         }
//         editor.commit();
}
