import 'package:flutter/material.dart';
import 'package:newfirebaseproject/setup/signin.dart';
import 'package:newfirebaseproject/setup/signup.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome You"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text("Sign in"),
            onPressed: NavigatetoSignIn,
          ),
          RaisedButton(
            child: Text("Sign up"),
            onPressed: NavigatetoSignup,
          ),
        ],
      ),
    );
  }

  void NavigatetoSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
            fullscreenDialog: true));
  }

  void NavigatetoSignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return SignUp();
            },
            fullscreenDialog: true));
  }
}
