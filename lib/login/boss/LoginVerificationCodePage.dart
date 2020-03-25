import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttercmcanyin/login/effect.dart';
import 'package:fluttercmcanyin/login/reducer.dart';
import 'package:fluttercmcanyin/login/state.dart';

/// 验证码输入页面
class LoginVerificationCodePage extends Page<LoginState, Map<String, dynamic>> {
  LoginVerificationCodePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LoginState>(
              adapter: null, slots: <String, Dependent<LoginState>>{}),
          middleware: <Middleware<LoginState>>[],
        );
}

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      leading: BackButton(),
    ),
    body: Text("验证码输入页面"),
  );
}
