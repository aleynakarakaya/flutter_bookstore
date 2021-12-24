import 'package:flutter/material.dart';
import 'package:flutter_kitaplik/Widgets/cardInfo.dart';
import 'package:flutter_kitaplik/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [kPrimaryDarkPink, kPrimaryPink]),
        ),
        child: ListView(children: <Widget>[
          Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Text('KÜTÜPHANE',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        )),
                  ),
                )),
            CardInfo()
          ]),
        ]),
      ),
    );
  }
}
