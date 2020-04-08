import 'dart:convert';

import 'package:fluttercmcanyin/bean/user_entity.dart';
import 'package:fluttercmcanyin/generated/json/base/json_convert_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static final UserRepository _singleton = new UserRepository._internal();
  UserData user;

  UserRepository._internal();

  static getInstance() {
    return _singleton;
  }

  setUser(UserData data) async {
    user = data;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(data.toJson()));
  }

  initUser() async {
    if (user == null) {
      var prefs = await SharedPreferences.getInstance();
      var userJson = prefs.getString("user");
      if (userJson != null) {
        user = JsonConvert.fromJsonAsT<UserData>(json.decode(userJson));
      }
    }
  }
}
