import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/sign_button.dart';
import 'package:avatar_glow/avatar_glow.dart';

// ignore: must_be_immutable
class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  String _username;

  @override
  _SigninPageState createState() => _SigninPageState();

}

class _SigninPageState extends State<SigninPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              endRadius: 110.0,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                  radius: 80.0,
                ),
              ),
            ),
            SizedBox(height: 60,),
            SignInButton(
                buttonType: ButtonType.google,
                onPressed: () {
                  print('click');
                }
            )
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
