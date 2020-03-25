import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_verification_code/flutter_verification_code.dart';
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
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            "输入验证码",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          margin: EdgeInsets.only(left: 30, top: 34),
        ),
        Container(
          child: Text(
            "短信验证码发送失败，请点击重新获取验证码",
            style: TextStyle(fontSize: 13, color: Color(0xff333333)),
          ),
          margin: EdgeInsets.only(left: 30),
        ),
        Container(
          child: VerificationCode(
            keyboardType: TextInputType.number,
            length: 4,
            itemSize: (MediaQuery.of(viewService.context).size.width - 60)/4,
            textStyle: TextStyle(
                fontSize: 22,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
            autofocus: true,
            onCompleted: (String value) {
              //...
              print(value);
            },
          ),
          margin: EdgeInsets.only(left: 30,top: 30),
        ),
        Offstage(
          child: Container(
            child: Text(
              "验证码错误，请重新输入",
              style: TextStyle(fontSize: 13, color: Color(0xffFFAE44)),
            ),
            margin: EdgeInsets.only(left: 30,top: 10),
          ),
          offstage: false,
        ),
      ],
    ),
  );
}
