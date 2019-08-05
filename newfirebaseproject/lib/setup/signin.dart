import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newfirebaseproject/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  bool passwordstate;
  static int aa = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (input) {
                    setState(() {
                      if (input.isEmpty) {
                        return "Enter Your Email";
                      }
                    });
                  },
                  onSaved: (input) {
                    _email = input;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (input) {
                    setState(() {
                      if (input.length <= 6) {
                        return "Please enter a valid password";
                      }
                    });
                  },
                  onSaved: (input) {
                    _password = input;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: getpasswordstate(passwordstate),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          getpasswordstate(passwordstate);
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                      )),
                ],
              ),
              RaisedButton(
                  child: Text("Sign in"),
                  onPressed: () {
                    setState(() {
                      // debugPrint(
                      // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

                      signIn();
                    });
                  })
            ],
          ),
        ));
  }

  bool getpasswordstate(bool state) {
    if (state == null) {
      aa = aa + 1;
      return true;
    }
    aa = aa + 1;
    if (aa % 2 == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> signIn() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          debugPrint(
              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

          return Home(user: user);
        }));
      } catch (e) {
        debugPrint(
            "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        print(e.message);
      }
    }
  }
}
