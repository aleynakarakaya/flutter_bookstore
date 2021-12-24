import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kitaplik/Screens/BookstorePage.dart';
import 'package:flutter_kitaplik/Screens/HomePage.dart';
import 'package:flutter_kitaplik/Widgets/labelTextWidget.dart';
import 'package:flutter_kitaplik/Widgets/emailField.dart';
import 'package:flutter_kitaplik/Widgets/hesapOlustur.dart';
import 'package:flutter_kitaplik/Widgets/sifreField.dart';
import 'package:flutter_kitaplik/Widgets/signInButton.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  //final FotografEkle image = new FotografEkle();

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
                            image: AssetImage('assets/book.png'),
                            width: 150,
                            height: 150),
                  ),
                )),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                pickImage();
              },
              child: const Text('Kapak fotoğrafı seçiniz'),
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
                          LabelTextWidget(degisken: "Kitap Adı"),
                          SizedBox(height: 20),
                          LabelTextWidget(degisken: "Yazarı"),
                          SizedBox(height: 30),
                          LabelTextWidget(
                            degisken: "Okuma Tarihi",
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SigninButton(
                                child: Text("Kitabı Kaydet",
                                    style: TextStyle(
                                        fontFamily: "RobotoMedium",
                                        fontSize: 15,
                                        color: Colors.white)),
                                width: 100,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookstorePage())),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SigninButton(
                                child: Text("Kitaplığım",
                                    style: TextStyle(
                                        fontFamily: "RobotoMedium",
                                        fontSize: 15,
                                        color: Colors.white)),
                                width: 100,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookstorePage())),
                              ),
                            ],
                          ),
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
