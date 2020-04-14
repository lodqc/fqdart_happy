import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeState implements Cloneable<HomeState> {
  int currentIndex = 0;
  int page = 1;
  var tabs;
  RetailListEntityData data;
  TabController controller;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  HomeState clone() {
    return HomeState()
      ..page
      ..currentIndex;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
