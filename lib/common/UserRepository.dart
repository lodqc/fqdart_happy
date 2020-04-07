import 'dart:convert';

import 'package:fluttercmcanyin/bean/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static final UserRepository _singleton = new UserRepository._internal();
  UserData user;



  factory UserRepository() {
    return _singleton;
  }

  UserRepository._internal();

  Future<void> setUser(UserData data) async {
    user = data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", data.toString());
  }
}
