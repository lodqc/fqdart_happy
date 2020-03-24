import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/login/action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "您的角色是",
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(left: 28, top: 85),
          ),
          Container(
            child: Text(
              "我们根据选择为您提供精准服务",
              style: TextStyle(color: Color(0xff666666), fontSize: 14),
            ),
            margin: EdgeInsets.only(left: 28, top: 3),
          ),
          GestureDetector(
            child: Container(
              child: Image(
                image: AssetImage("img/ic_iamboss.png"),
              ),
              margin: EdgeInsets.only(left: 13, top: 40, right: 13),
            ),
            onTap: () {
              dispatch(LoginActionCreator.openLogin());
            },
          ),
          GestureDetector(
            child: Container(
              child: Image(
                image: AssetImage("img/ic_iamwaiter.png"),
              ),
              margin: EdgeInsets.only(left: 13, right: 13),
            ),
            onTap: () {
              dispatch(LoginActionCreator.openLogin());
            },
          ),
        ],
      ));
}
