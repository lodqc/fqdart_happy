import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttercmcanyin/http/API.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.openLogin: _openLogin,
    LoginAction.postSendsms: _postSendsms,
  });
}

_postSendsms(Action action, Context<LoginState> ctx) async {
  var baseBean = await HttpUtil().post<String>(API.SENDSMS,
      data: {"mobile": ctx.state.phoneController.text});
  if (baseBean.code == 0) {
    Navigator.of(ctx.context).pushNamed('login_verificationcode_page', arguments: null);
  } else {
    Toast.show(baseBean.msg, ctx.context);
  }
}

void _openLogin(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_boss_page', arguments: null);
}
