import 'package:fish_redux/fish_redux.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.postData: _postData,
    },
  );
}

HomeState _postData(HomeState state, Action action) {
  final RetailListEntityData data = action.payload ?? RetailListEntityData();
  final HomeState newState = state.clone();
  if(newState.data == null||newState.data.shopList == null){
    newState.data = data;
  }else{
    newState.data.shopList.addAll(data.shopList);
  }
  return newState;
}
