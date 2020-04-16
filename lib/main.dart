import 'dart:io';

import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:fluttercmcanyin/common/RoutesRepository.dart';
import 'package:fluttercmcanyin/common/UserRepository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  runApp(RefreshConfiguration(
    headerBuilder: () => MaterialClassicHeader(),
    // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
    footerBuilder: () => ClassicFooter(),
    // 配置默认底部指示器
    headerTriggerDistance: 80.0,
    // 头部触发刷新的越界距离
    springDescription:
        SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
    // 自定义回弹动画,三个属性值意义请查询flutter api
    maxOverScrollExtent: 100,
    //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
    maxUnderScrollExtent: 0,
    // 底部最大可以拖动的范围
    enableScrollWhenRefreshCompleted: true,
    //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
    enableLoadingWhenFailed: true,
    //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
    hideFooterWhenNotFull: false,
    // Viewport不满一屏时,禁用上拉加载更多功能
    enableBallisticLoad: true,
    // 可以通过惯性滑动触发加载更多
    child: MaterialApp(
      title: 'FishDemo',
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: new AppBarTheme(elevation: 0),
          platform: TargetPlatform.iOS),
      home: SplashScreen.navigate(
        name: 'intro.flr',
        next: (_) =>
            RoutesRepository.getInstance().routes.buildPage(getPage(), null),
        until: () => Future.delayed(Duration(seconds: 3)),
        startAnimation: '1',
      ), //把他作为默认页面
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return RoutesRepository.getInstance()
              .routes
              .buildPage(settings.name, settings.arguments);
        });
      },
    ),
  ));
}

getPage() {
  if (UserRepository.getInstance().user == null) {
    return "login_page";
  } else {
    return "home_page";
  }
}
