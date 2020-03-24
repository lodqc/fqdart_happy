import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercmcanyin/login/boss/LoginBossPage.dart';
import 'package:fluttercmcanyin/login/page.dart';

void main() {
  final AbstractRoutes routes =
      PageRoutes(pages: <String, Page<Object, dynamic>>{
    'login_page': LoginPage(), //在这里添加页面
    'login_boss_page': LoginBossPage(), //在这里添加页面
  });

  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        appBarTheme: new AppBarTheme(elevation: 0),
        platform: TargetPlatform.iOS),
    home: routes.buildPage('login_page', null), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  ));
}
