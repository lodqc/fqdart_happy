import 'dart:developer';
import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.openLogin: _openLogin,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {
  Toast.show("Effect",ctx.context);
}

void _openLogin(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_boss_page', arguments: null);
}
