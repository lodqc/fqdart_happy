import 'package:flutter/material.dart';
import 'package:fluttercmcanyin/common/Constants.dart';
import 'package:fluttercmcanyin/http/HttpUtil.dart';
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
                  child: TextField(
                    autofocus: true,
                    onChanged: (text) {
                      isEnable = text.trim().length == 11;
                      setState(() {});
                    },
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,

                    decoration: InputDecoration(
                      counterText: "",
                        hintText: "请输入手机号",
                        prefixIcon: Icon(Icons.phone_android),
                        suffixIcon: Offstage(
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _phoneController.clear();
                            },
                          ),
                          offstage: _phoneController.text.trim().length == 0,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          //未选中时候的颜色
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          //选中时外边框颜色
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        hintStyle:
                            TextStyle(color: Color(0xffcccccc), fontSize: 16)),
                  ),
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
                      var response = await HttpUtil().get("http://www.baidu.com");
                      print(response.toString());
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
