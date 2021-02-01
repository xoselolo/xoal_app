import 'package:flutter/material.dart';
import 'package:xoalapp/signin_page.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SigninPage(),
      //home: MyHomePage(username: 'XoseLoLo38', experience: "3 plantas cultivadas",),

    );
  }
}