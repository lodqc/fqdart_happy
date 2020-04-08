import 'dart:developer';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttercmcanyin/bean/base_entity.dart';
import 'package:fluttercmcanyin/bean/user_entity.dart';
import 'package:fluttercmcanyin/common/UserRepository.dart';
import 'package:fluttercmcanyin/http/API.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.openLogin: _openLogin,
    LoginAction.postSendsms: _postSendsms,
    LoginAction.postSnsLogin: _postSnsLogin,
  });
}

void _openLogin(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_boss_page', arguments: null);
}

_postSendsms(Action action, Context<LoginState> ctx) async {
  var baseBean = await HttpUtil().post<BaseEntity>(API.SENDSMS,
      data: {"mobile": ctx.state.phoneController.text});
  if (baseBean.code == 0) {
    Navigator.of(ctx.context).pushNamed('login_verificationcode_page');
  } else {
    Toast.show(baseBean.msg, ctx.context);
  }
}

void _postSnsLogin(Action action, Context<LoginState> ctx) async {
  var baseBean = await HttpUtil().post<UserEntity>(API.LOGIN, data: {
    "mobile": ctx.state.phoneController.text,
    "smscode": ctx.state.smscode
  });
  if (baseBean.code == 0) {
    UserRepository.getInstance().setUser(baseBean.data);
    Navigator.of(ctx.context).pushNamed('home_page');
  } else {
    Toast.show(baseBean.msg, ctx.context);
  }
}
