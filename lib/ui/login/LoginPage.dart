import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/bean/BaseBean.dart';
import 'package:fluttercmcanyin/common/Constants.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
import 'package:fluttercmcanyin/weight/CommonTextField.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  var type = Constants.LOGIN_TYPE_BOSS;

  LoginPage({Key key, int type}) : super(key: key) {
    this.type = type;
  }

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = new TextEditingController();
  var isEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image(
                    image: AssetImage("img/ic_boss.png"),
                    width: 72,
                    height: 72,
                  ),
                  padding: EdgeInsets.only(top: 19),
                ),
                Padding(
                  child: Text(
                    "老板登录",
                    style: TextStyle(color: Color(0xff666666), fontSize: 14),
                  ),
                  padding: EdgeInsets.only(top: 8),
                ),
                Padding(
                  child:
                      UnderlineTextField("请输入手机号", _phoneController, (value) {},
                          prefixIcon: Icon(Icons.phone_android),
                          suffixIcon: Offstage(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _phoneController.clear();
                              },
                            ),
                            offstage: _phoneController.text.trim().length == 0,
                          )),
                  padding: EdgeInsets.only(top: 20, left: 22, right: 22),
                ),
                Padding(
                  child: FlatButton(
                    color: isEnable ? Color(0xff2E7BFD) : Color(0x882E7BFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      width: 330,
                      height: 50,
                      child: Center(
                        child: Text(
                          "获取短信验证码",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var text = _phoneController.text.trim();
                      if (text.length == 0) {
                        Toast.show("手机号不能为空", context);
                        return;
                      }
                      if (text.length < 11) {
                        Toast.show("手机号不能少于11位", context);
                        return;
                      }
                      var baseBean = BaseBean.fromJson(jsonDecode(
                          await HttpUtil().post("user/sendsms",
                              data: {"mobile": "17610123767"})));
                      Toast.show(baseBean.msg, context);
                    },
                  ),
                  padding: EdgeInsets.only(left: 22, top: 40, right: 22),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
