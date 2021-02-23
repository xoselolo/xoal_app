import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/sign_button.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'home_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  String _username;

  @override
  _SigninPageState createState() => _SigninPageState();

}

class _SigninPageState extends State<SigninPage> {

  Future<String> signInWithGoogle() async {

    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      print("Hola: ");
      print(user);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

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
                  signInWithGoogle().then((result){
                    if(result != null){
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => MyHomePage(username: "xoselolo", experience: "3 planted",)
                        )
                      );
                    }
                  });
                }
            )
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
