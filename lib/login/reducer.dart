import 'package:fish_redux/fish_redux.dart';
import 'package:fluttercmcanyin/login/action.dart';
import 'package:fluttercmcanyin/login/state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.onRefrsh: _onRefrsh,
    },
  );
}

LoginState _onRefrsh(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}
