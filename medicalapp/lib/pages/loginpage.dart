import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/pages/dashpage.dart';
import 'package:medicalapp/pages/signup.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          navigate(Home());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Login Page"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  navigate(Home());
                }),
          ),
          body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Login'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        )
                            .catchError((onError) {
                          print(onError);
                        }).then((FirebaseUser user) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LogingHome(user: user);
                          }));
                        }).catchError((onError) {
                          print(onError);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Dont you have a account"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Sign up'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

// moveToLastScreen()
// {
//   Nav
// }
  navigate(Widget wid) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return wid;
    }));
  }
}
