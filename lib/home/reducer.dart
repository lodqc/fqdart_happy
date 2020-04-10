import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.onTap: _onTap,
    },
  );
}

HomeState _onTap(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.currentIndex = state.currentIndex;
  return newState;
}
