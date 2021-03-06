import 'package:fish_redux/fish_redux.dart';
import 'package:fluttercmcanyin/login/effect.dart';
import 'package:fluttercmcanyin/login/reducer.dart';
import 'package:fluttercmcanyin/login/state.dart';
import 'package:fluttercmcanyin/login/view.dart';


class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage({ViewBuilder<String> view})
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: view ?? buildView,
          dependencies: Dependencies<LoginState>(
              adapter: null, slots: <String, Dependent<LoginState>>{}),
          middleware: <Middleware<LoginState>>[],
        );
}
