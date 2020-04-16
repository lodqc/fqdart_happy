import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';
import 'package:fluttercmcanyin/home/action.dart';
import 'package:fluttercmcanyin/weight/WebViewExample.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>>
    with TickerProviderMixin {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: null, slots: <String, Dependent<HomeState>>{}),
          middleware: <Middleware<HomeState>>[],
        );
}

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: getBody(state, dispatch),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        getUnselctItem(state, 0),
        getUnselctItem(state, 1),
        getUnselctItem(state, 2),
        getUnselctItem(state, 3),
      ],
      currentIndex: state.currentIndex,
      onTap: (int index) {
        state.currentIndex = index;
        dispatch(HomeActionCreator.onTap());
      },
    ),
  );
}

Widget getBody(HomeState state, Dispatch dispatch) {
  Widget body;
  switch (state.currentIndex) {
    case 1:
      {
        body = getSubscribeWeight(state, dispatch);
        break;
      }
    default:
      {
        body = getHomeWeight(state, dispatch);
        break;
      }
  }
  return body;
}

Widget getSubscribeWeight(HomeState state, dispatch) {
  return WebViewExample();
}

SmartRefresher getHomeWeight(HomeState state, Dispatch dispatch) {
  return SmartRefresher(
    controller: state.refreshController,
    enablePullUp: true,
    child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: getTitleWeight(),
          elevation: 0,
          bottom: TabBar(
            controller: state.controller,
            //可以和TabBarView使用同一个TabController
            tabs: state.tabs,
            isScrollable: true,
            indicatorColor: Color(0x00F54D4B),
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Color(0xffF54D4B),
            labelStyle: TextStyle(
              fontSize: 15.0,
            ),
            unselectedLabelColor: Color(0xff999999),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.0,
            ),
          ),
          floating: false,
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: new FlexibleSpaceBar(
            background: Container(
              margin: EdgeInsets.only(top: 70, bottom: 30),
              child: Image.asset("img/img_banner_ls@3x.png", fit: BoxFit.fill),
            ),
          ),
          snap: false,
        ),
        SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, index) => Container(
              child: getItem(state.data.shopList.elementAt(index)),
              decoration: BoxDecoration(color: Colors.white),
              height: (state.data.shopList.elementAt(index).goodsList != null &&
                      state.data.shopList.elementAt(index).goodsList.length > 0)
                  ? 243
                  : 111,
            ),
            childCount: state.data != null && state.data.shopList != null
                ? state.data.shopList.length
                : 0,
          ),
        ),
      ],
    ),
    header: MaterialClassicHeader(
      color: Colors.red,
    ),
    onRefresh: () {
      dispatch(HomeActionCreator.onRefresh());
    },
    onLoading: () {
      dispatch(HomeActionCreator.onLoading());
      state.refreshController.loadComplete();
    },
  );
}

getItem(RetailListEntityDataShopList bean) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: 20,
        left: 14,
        child: Container(
          width: 80,
          height: 80,
          child: Image.network(bean.logoImg),
        ),
      ),
      Positioned(
        top: 20,
        left: 105,
        child: Text(
          bean.shopName,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff36383A)),
        ),
      ),
      Positioned(
        top: 50,
        left: 105,
        child: Text(
          "月售${bean.monthSales}",
          style: TextStyle(fontSize: 12, color: Color(0xff999999)),
        ),
      ),
      Positioned(
        top: 70,
        left: 105,
        child: Text(
          "起送￥${bean.startDeliveryPrice}",
          style: TextStyle(fontSize: 12, color: Color(0xff666666)),
        ),
      ),
      Positioned(
        top: 70,
        left: 170,
        child: Text(
          bean.deliveryCost > 0 ? "配送￥${bean.deliveryCost}" : "免费配送",
          style: TextStyle(fontSize: 12, color: Color(0xff666666)),
        ),
      ),
      Positioned(
        top: 36,
        right: 15,
        child: Text(
          "${bean.needTime}分钟",
          style: TextStyle(fontSize: 12, color: Color(0xff666666)),
        ),
      ),
      Positioned(
        top: 53,
        right: 15,
        child: Text(
          "${bean.distance}km",
          style: TextStyle(fontSize: 12, color: Color(0xff999999)),
        ),
      ),
      Offstage(
        offstage: bean.goodsList == null,
        child: Container(
          margin: EdgeInsets.only(left: 105, top: 103),
          height: 160,
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                Image.network(
                  bean.goodsList.elementAt(index).picture,
                  width: 80,
                  height: 80,
                ),
                Text(
                  bean.goodsList.elementAt(index).goodsName,
                  style: TextStyle(fontSize: 12, color: Color(0xff333333)),
                ),
                Text(
                  "￥${bean.goodsList.elementAt(index).finalPrice}",
                  style: TextStyle(fontSize: 12, color: Color(0xffFF4D42)),
                ),
              ],
            ),
            itemCount: bean.goodsList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.only(
              top: bean.goodsList.isEmpty ? 110 : 242, left: 105),
          child: Divider(
            height: 1,
            indent: 0.0,
            color: Color(0xffEEEEEE),
          ))
    ],
  );
}

getTitleWeight() {
  return Row(
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      Container(
        width: 15,
        height: 15,
        margin: EdgeInsets.only(left: 10, right: 4.5, top: 2),
        child: Image(
          image: AssetImage("img/icon_positioning@3x.png"),
        ),
      ),
      Text(
        "花园城(蛇口美年广场)",
        style: TextStyle(
            fontSize: 19,
            color: Color(0xff030303),
            fontWeight: FontWeight.bold),
      ),
      Container(
        width: 15,
        height: 15,
        margin: EdgeInsets.only(left: 9, top: 2),
        child: Image(
          image: AssetImage("img/icon_arrow_wm@3x.png"),
        ),
      ),
    ],
  );
}

BottomNavigationBarItem getUnselctItem(HomeState state, int index) {
  if (state.currentIndex == index) {
    return BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(getImagePath(state, index)),
          width: 22,
          height: 22,
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            getName(index),
            style: TextStyle(fontSize: 10, color: Color(0xffF54D4C)),
          ),
        ));
  } else {
    return BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(getImagePath(state, index)),
          width: 22,
          height: 22,
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            getName(index),
            style: TextStyle(fontSize: 10, color: Color(0xff808080)),
          ),
        ));
  }
}

String getName(int index) {
  switch (index) {
    case 0:
      return "首页";
    case 1:
      return "订阅";
    case 2:
      return "订单";
    case 3:
      return "我的";
  }
}

String getImagePath(HomeState state, int index) {
  switch (index) {
    case 0:
      return state.currentIndex == index
          ? "img/icon_home_press.png"
          : "img/icon_home_normal.png";
    case 1:
      return state.currentIndex == index
          ? "img/icon_subscription_press.png"
          : "img/icon_subscription_normal.png";
    case 2:
      return state.currentIndex == index
          ? "img/icon_order_press.png"
          : "img/icon_order_normal.png";
    case 3:
      return state.currentIndex == index
          ? "img/icon_mine_press.png"
          : "img/icon_mine_normal.png";
  }
}
