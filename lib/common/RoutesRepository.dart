import 'package:fish_redux/fish_redux.dart';
import 'package:fluttercmcanyin/home/HomePage.dart';
import 'package:fluttercmcanyin/login/boss/LoginBossPage.dart';
import 'package:fluttercmcanyin/login/boss/LoginVerificationCodePage.dart';
import 'package:fluttercmcanyin/login/page.dart';

class RoutesRepository {
  static final RoutesRepository _singleton = new RoutesRepository._internal();

  RoutesRepository._internal();

  final AbstractRoutes routes =
      PageRoutes(pages: <String, Page<Object, dynamic>>{
    'login_page': LoginPage(), //在这里添加页面
    'login_boss_page': LoginBossPage(), //在这里添加页面
    'login_verificationcode_page': LoginVerificationCodePage(), //在这里添加页面
    'home_page': HomePage(), //在这里添加页面
  });

  static getInstance() {
    return _singleton;
  }
}
