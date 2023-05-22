// @dart=2.12

import 'dart:math';

import 'package:p2p/models/login_model.dart';
import 'package:p2p/navigation/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:p2p/screens/home_screen.dart';
import 'package:p2p/screens/home_screen_visitor.dart';
// import 'package:here_sdk/core.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

var loginResult = new Login();
// var registerResult = new Register();
// var checkResult = new CheckNomor();
// var otpResult = new Otp();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: HomeScreenVisitor(),
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var phoneLoginController = new TextEditingController();
  var passwordLoginController = new TextEditingController();

  var phoneRegController = new TextEditingController();
  var passwordRegController = new TextEditingController();
  final storage = new FlutterSecureStorage();

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  void _addNewItem(String keyy, String valuee) async {
    final String key = keyy;
    final String value = valuee;

    await storage.write(key: key, value: value);
    final String data = await storage.read(key: key) ?? "";
    //print(data);
  }

  int generateOtp() {
    var rng = new Random();
    var rand = rng.nextInt(9000) + 1000;
    return rand.toInt();
  }

  String tok = "";
  void get() async {
    tok = await storage.read(key: "token") ?? "";
  }

  bool _passwordVisible = true;

  @override
  void initState() {
    get();
    super.initState();
    _passwordVisible = true;

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        // _loginHeight = windowHeight;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFF358873);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        // _loginYOffset = 270;
        // _loginHeight = windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFF358873);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return tok != ""
        ? NavigateScreen(
            id: 0,
          )
        : Stack(
            children: <Widget>[
              AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1000),
                  color: _backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageState = 0;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: Duration(milliseconds: 1000),
                                margin: EdgeInsets.only(
                                  top: _headingTop,
                                ),
                                child: Text(
                                  "Bitanic",
                                  style: TextStyle(
                                      color: _headingColor, fontSize: 28),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  "We brought IoT Into the next level\nYou put it, you got it!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _headingColor, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Center(
                          child: Image.asset("assets/images/landing.png"),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_pageState != 0) {
                                _pageState = 0;
                              } else {
                                _pageState = 1;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(32),
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFF207567),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              AnimatedContainer(
                padding: EdgeInsets.all(32),
                width: _loginWidth,
                height: _loginHeight,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                transform:
                    Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(_loginOpacity),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Login To Continue",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        InputWithIcon(
                          icon: Icons.phone_rounded,
                          hint: "Enter Phone Number...",
                          password: false,
                          controller: phoneLoginController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFBC7C7C7), width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  width: 60,
                                  child: Icon(
                                    Icons.vpn_key,
                                    size: 20,
                                    color: Color(0xFFBB9B9B9),
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: passwordLoginController,
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Color(0xFF207567),
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      hintText: "Enter Password"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("DATA NIH yaaaa");
                            EasyLoading.show(status: 'loading...');
                            //print("Nama =" + emailController.text);
                            Login.connectToApi(phoneLoginController.text,
                                    passwordLoginController.text)
                                .then((value) {
                              loginResult = value;
                              setState(() {
                                //print(storage.read(key: "token"));
                                if (loginResult.status == 200) {
                                  _addNewItem("token", loginResult.token);
                                  _addNewItem(
                                      "password", passwordLoginController.text);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NavigateScreen(
                                      id: 0,
                                    );
                                  }));
                                } else {
                                  _showDialog(context, loginResult.message);
                                }
                              });
                            });
                            EasyLoading.dismiss();
                          },
                          child: PrimaryButton(
                            btnText: "Login",
                            login: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageState = 2;
                            });
                          },
                          child: OutlineBtn(
                            btnText: "Create New Account",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Text(
                            "versi 2.0.0",
                            style: TextStyle(fontSize: 14)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "© 2022 Makerindo",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                height: _registerHeight,
                padding: EdgeInsets.all(32),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(0, _registerYOffset, 1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Create a New Account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        InputWithIcon(
                          icon: Icons.phone_rounded,
                          hint: "Enter Phone Number...",
                          password: false,
                          controller: phoneRegController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputWithIcon(
                          icon: Icons.vpn_key,
                          hint: "Enter Password...",
                          password: true,
                          controller: passwordRegController,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // CheckNomor.connectToApi(phoneRegController.text)
                            //     .then((value) {
                            //   checkResult = value;
                            //   setState(() {
                            //     //print(storage.read(key: "token"));
                            //     if (checkResult.status == 200) {
                            //       print("DATA NIH");
                            //       int otp = generateOtp();
                            //       _addNewItem("otp", otp.toString());
                            //       EasyLoading.show(status: 'loading...');
                            //       //print("Nama =" + emailController.text);
                            //       Otp.connectToApi(
                            //               phoneRegController.text,
                            //               "Kode OTP Aplikasi Bitanic anda adalah " +
                            //                   otp.toString() +
                            //                   " Jangan beri kode ini kepada siapapun, Termasuk Bitanic. Waspada Penipuan\n\n\nSalam\nBitanic Team.")
                            //           .then((value) {
                            //         otpResult = value;
                            //         setState(() {
                            //           _addNewItem(
                            //               "phone_reg", phoneRegController.text);
                            //           _addNewItem("password_reg",
                            //               passwordRegController.text);
                            //           //print(storage.read(key: "token"));
                            //           if (otpResult.status == 200) {
                            //             Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         // VerifyPage()));
                            //           } else {
                            //             _showDialog(context, otpResult.message);
                            //           }
                            //         });
                            //       });
                            //       EasyLoading.dismiss();
                            //     } else {
                            //       _showDialog(context,
                            //           "Nomor Hp telah terdaftar, silahkan masukkan no hp yang belum terdaftar");
                            //     }
                            //   });
                            // });
                          },
                          child: PrimaryButton(
                            btnText: "Create Account",
                            login: false,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageState = 1;
                            });
                          },
                          child: OutlineBtn(
                            btnText: "Back To Login",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
    ;
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool password;
  final TextEditingController controller;
  InputWithIcon(
      {required this.icon,
      required this.hint,
      required this.password,
      required this.controller});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.password,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  border: InputBorder.none,
                  hintText: widget.hint),
            ),
          )
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context, String pesan) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Perhatian!"),
        content: new Text(pesan),
        actions: <Widget>[
          new TextButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  final bool login;
  PrimaryButton({required this.btnText, required this.login});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF207567), borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(13),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({required this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF207567), width: 2),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Color(0xFF207567), fontSize: 16),
        ),
      ),
    );
  }
}
