import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';
import 'package:fluttercmcanyin/home/action.dart';
import 'package:fluttercmcanyin/http/API.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
import 'package:toast/toast.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onInit,
    HomeAction.onRefresh: _onRefresh,
    HomeAction.onLoading: _onLoading,
  });
}

_onInit(Action action, Context<HomeState> ctx) async {
  ctx.state.tabs = <Tab>[
    Tab(
      text: "距离最近",
    ),
    Tab(
      text: "起送价最低",
    ),
    Tab(
      text: "配送价最低",
    ),
    Tab(
      text: "销量最高",
    ),
  ];
  //initialIndex初始选中第几个
  ctx.state.controller =
      TabController(initialIndex: 0, length: ctx.state.tabs.length,vsync: ctx.stfState as TickerProvider);
  await getData(ctx);
}

_onRefresh(Action action, Context<HomeState> ctx) async {
  ctx.state.page = 1;
  await getData(ctx);
}

_onLoading(Action action, Context<HomeState> ctx) async {
  ctx.state.page++;
  await getData(ctx);
}

Future getData(Context<HomeState> ctx) async {
  var bean = await HttpUtil.getInstance().post<RetailListEntityEntity>(
      API.GET_SHOP_LIST_NEW,
      baseUrl: API.BASE_RETAIL_URL,
      data: {
        "lng": "113.920864",
        "name": "",
        "lat": "22.502374",
        "order": "5",
        "limit": "10",
        "page": ctx.state.page,
        "limit": "10"
      });
  if (bean.code == 0) {
    ctx.dispatch(HomeActionCreator.onPostData(bean.data));
  } else {
    Toast.show(bean.msg, ctx.context);
  }
}
