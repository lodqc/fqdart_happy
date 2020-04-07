import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController phoneController = TextEditingController();
  var isEnable = false;
  String smscode = "";

  @override
  LoginState clone() {
    return LoginState()
      ..isEnable = phoneController.text.length == 11
      ..phoneController = phoneController;
  }
}

class LoginRepository {
  static final LoginRepository _singleton = new LoginRepository._internal();
  LoginState loginState;

  factory LoginRepository() {
    return _singleton;
  }

  LoginRepository._internal();
}

LoginState initState(Map<String, dynamic> args) {
  if(LoginRepository().loginState == null){
    LoginRepository().loginState = LoginState();
  }else{
    LoginRepository().loginState = LoginRepository().loginState.clone();
  }
  return LoginRepository().loginState;
}
