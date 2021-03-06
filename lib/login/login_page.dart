import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home/home_page.dart';
import 'package:flutter_login/login/forget_password_page.dart';
import 'package:flutter_login/login/register_page.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_login/utils/toast.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  String imgUrl;
  String username;
  String password;
  Color content = Colors.grey;

  @override
  void initState() {
    super.initState();
    imgUrl = "images/hiddenPassword.png";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //取消右上角debug标识
      home: Scaffold(
          body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            //触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            /*
            获取当前屏幕宽高
            MediaQuery.of(context).size.width
            MediaQuery.of(context).size.height
             */
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(100),
                        alignment: Alignment.center,
                        child: Text(
                          'Flutter仿QQ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            hintText: "QQ号/手机号/邮箱",
                            border: InputBorder.none,
                          ),
                          onChanged: (str) {
                            username = str;
                            if (password.trim().isNotEmpty && username.trim().isNotEmpty) {
                              content = Colors.lightBlueAccent;
                            } else {
                              content = Colors.grey;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "输入密码", border: InputBorder.none),
                                obscureText: showPassword,
                                onChanged: (str) {
                                  password = str;
                                  if (password.trim().isNotEmpty &&
                                      username.trim().isNotEmpty) {
                                    content = Colors.lightBlueAccent;
                                  } else {
                                    content = Colors.grey;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(imgUrl),
                              onPressed: () {
                                if (imgUrl == "images/hiddenPassword.png") {
                                  imgUrl = "images/lookPassword.png";
                                } else {
                                  imgUrl = "images/hiddenPassword.png";
                                }
                                if (showPassword) {
                                  showPassword = false;
                                } else {
                                  showPassword = true;
                                }
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                            color: content,
                            border: Border.all(
                              color: content,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                        child: IconButton(
                          onPressed: () {
                            if (content == Colors.lightBlueAccent) {
                              NavigatorUtil.pop(context);
                            NavigatorUtil.push(context, HomePage());
                            } else {
                              Toast.toast(context, msg: "请输入账号或密码！");
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80, right: 80,bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            NavigatorUtil.push(context, ForgetPasswordPage());
                          },
                          child: Text(
                            '忘记密码',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                        height: 12,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey),
                        ),
                      ),

                      Expanded(
                        child: FlatButton(
                          onPressed: () =>NavigatorUtil.push(context, RegisterPage()),
                          child: Text('立即注册'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
