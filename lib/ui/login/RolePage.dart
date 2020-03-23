import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/common/Constants.dart';
import 'package:fluttercmcanyin/ui/login/LoginPage.dart';
import 'package:toast/toast.dart';

class RolePage extends StatefulWidget {
  RolePage({Key key}) : super(key: key);

  @override
  _RolePageState createState() {
    return _RolePageState();
  }
}

class _RolePageState extends State<RolePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new LoginPage(type: Constants.LOGIN_TYPE_BOSS);
            }));
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
            Toast.show("kkk", context);
          },
        ),
      ],
    ));
  }
}
