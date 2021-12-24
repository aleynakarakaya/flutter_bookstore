import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kitaplik/Screens/HomePage.dart';
import 'package:flutter_kitaplik/Widgets/labelTextWidget.dart';
import 'package:flutter_kitaplik/Widgets/signInButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? image;
  TextEditingController kEmail = TextEditingController();
  TextEditingController kPassword = TextEditingController();

  //final FotografEkle image = new FotografEkle();

  kayitOl() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: kEmail.text, password: kPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                    child: image != null
                        ? Image.file(image!)
                        : Image(
                            image: AssetImage('assets/profilePhoto.png'),
                            width: 150,
                            height: 150),
                  ),
                )),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                pickImage();
              },
              child: const Text('Profil fotoğrafı seçiniz'),
              color: kPrimaryDarkPink,
              textColor: Colors.white,
            ),
            Padding(
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
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(173, 183, 192, 1),
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(173, 183, 192, 1)),
                              ),
                            ),
                            controller: kEmail,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Şifre",
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(173, 183, 192, 1),
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(173, 183, 192, 1)),
                              ),
                            ),
                            controller: kPassword,
                          ),
                          SizedBox(height: 30),
                          LabelTextWidget(
                            degisken: "Ad Soyad",
                          ),
                          SizedBox(height: 30),
                          SigninButton(
                              child: Text("Kayıt Ol",
                                  style: TextStyle(
                                      fontFamily: "RobotoMedium",
                                      fontSize: 20,
                                      color: Colors.white)),
                              onPressed: () {
                                kayitOl();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }),
                          SizedBox(height: height * .050),
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
