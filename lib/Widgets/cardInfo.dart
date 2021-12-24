import 'package:flutter/material.dart';
import 'package:flutter_kitaplik/Widgets/emailField.dart';
import 'package:flutter_kitaplik/Widgets/hesapOlustur.dart';
import 'package:flutter_kitaplik/Widgets/sifreField.dart';
import 'package:flutter_kitaplik/Widgets/signInButton.dart';

class CardInfo extends StatefulWidget {
  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * .001),
                  EmailField(),
                  SizedBox(height: 20),
                  SifreField(),
                  SizedBox(height: 30),
                  SigninButton(
                    child: Text("Giriş Yap",
                        style: TextStyle(
                            fontFamily: "RobotoMedium",
                            fontSize: 20,
                            color: Colors.white)),
                    onPressed: () {},
                  ),
                  SizedBox(height: height * .050),
                  HesapOlustur(),
                ]),
          ),
        ),
      ),
    );
  }
}
