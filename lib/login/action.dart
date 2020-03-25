import 'package:fish_redux/fish_redux.dart';

//ACTION只能被一个类订阅   打开和网络请求放在effect.dart中，刷新页面在reducer.dart
enum LoginAction { openLogin, postSendsms, onRefrsh }

class LoginActionCreator {
  static Action openLogin() {
    return const Action(LoginAction.openLogin);
  }

  static Action postSendsms() {
    return const Action(LoginAction.postSendsms);
  }

  static Action onRefrsh() {
    return const Action(LoginAction.onRefrsh);
  }
}
