import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeState implements Cloneable<HomeState> {
  int currentIndex = 0;
  int page = 1;
  var tabs;
  TabController controller;
  RetailListEntityData data;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  HomeState clone() {
    return HomeState()
      ..currentIndex = currentIndex
      ..page = page
      ..tabs = tabs
      ..data = data
      ..controller = controller
      ..refreshController = refreshController;
  }

}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
