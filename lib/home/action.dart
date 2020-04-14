import 'package:fish_redux/fish_redux.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';

//TODO replace with your own action
enum HomeAction { postData,onRefresh,onLoading }

class HomeActionCreator {
  static Action onPostData(RetailListEntityData data) {
    return Action(HomeAction.postData, payload: data);
  }

  static onRefresh() {
    return Action(HomeAction.postData);
  }

  static onLoading() {
    return Action(HomeAction.postData);
  }
}
