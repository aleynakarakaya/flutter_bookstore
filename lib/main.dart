import 'package:flutter/material.dart';

import 'Screens/LoginPage.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryDarkPink,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Beklenilmeyen bir hata oluştu'));
              } else if (snapshot.hasData) {
                return LoginPage();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })

        //LoginPage(),
        );
  }
}
