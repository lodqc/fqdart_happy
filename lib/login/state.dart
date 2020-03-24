import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController phoneController = new TextEditingController();
  var isEnable = false;

  @override
  LoginState clone() {
    return LoginState()..phoneController = phoneController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
