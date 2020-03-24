import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action, openLogin }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }
  static Action openLogin() {
    return const Action(LoginAction.openLogin);
  }
}
