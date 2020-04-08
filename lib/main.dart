import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercmcanyin/common/RoutesRepository.dart';
import 'package:fluttercmcanyin/common/UserRepository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserRepository.getInstance().initUser();
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
        primaryColor: Colors.white,
        appBarTheme: new AppBarTheme(elevation: 0),
        platform: TargetPlatform.iOS),
    home: RoutesRepository.getInstance().routes.buildPage(getPage(), null), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return RoutesRepository.getInstance().routes.buildPage(settings.name, settings.arguments);
      });
    },
  ));
}

getPage() {
  if (UserRepository.getInstance().user == null) {
    return "login_page";
  } else {
    return "home_page";
  }
}
