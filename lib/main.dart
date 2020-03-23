import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/login/RolePage.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness:Brightness.light,
          primaryColor: Colors.white,
          appBarTheme: new AppBarTheme(elevation: 0),
          platform: TargetPlatform.iOS),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: RolePage(),
      ),
    );
  }
}
