import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttercmcanyin/http/API.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
import 'package:fluttercmcanyin/login/action.dart';
import 'package:fluttercmcanyin/login/effect.dart';
import 'package:fluttercmcanyin/login/reducer.dart';
import 'package:fluttercmcanyin/login/state.dart';
import 'package:fluttercmcanyin/weight/CommonWeight.dart';
import 'package:toast/toast.dart';

class LoginBossPage extends Page<LoginState, Map<String, dynamic>> {
  LoginBossPage()
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
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: Image(
                  image: AssetImage("img/ic_boss.png"),
                  width: 72,
                  height: 72,
                ),
                padding: EdgeInsets.only(top: 19),
              ),
              Padding(
                child: Text(
                  "老板登录",
                  style: TextStyle(color: Color(0xff666666), fontSize: 14),
                ),
                padding: EdgeInsets.only(top: 8),
              ),
              Padding(
                child: CmUnderlineTextField("请输入手机号", state.phoneController,
                    (value) {
                  dispatch(LoginActionCreator.onRefrsh());
                },
                    prefixIcon: Icon(Icons.phone_android),
                    suffixIcon: Offstage(
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          state.phoneController.clear();
                          dispatch(LoginActionCreator.onRefrsh());
                        },
                      ),
                      offstage: state.phoneController.text.trim().length == 0,
                    )),
                padding: EdgeInsets.only(top: 20, left: 22, right: 22),
              ),
              Padding(
                child: FlatButton(
                  color: state.isEnable ? Color(0xff2E7BFD) : Color(0x882E7BFD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    width: 330,
                    height: 50,
                    child: Center(
                      child: Text(
                        "获取短信验证码",
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 16),
                      ),
                    ),
                  ),
                  onPressed: () {
                    var text = state.phoneController.text.trim();
                    if (text.length == 0) {
                      Toast.show("手机号不能为空", viewService.context);
                      return;
                    }
                    if (text.length < 11) {
                      Toast.show("手机号不能少于11位", viewService.context);
                      return;
                    }
                    dispatch(LoginActionCreator.postSendsms());
                  },
                ),
                padding: EdgeInsets.only(left: 22, top: 40, right: 22),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
