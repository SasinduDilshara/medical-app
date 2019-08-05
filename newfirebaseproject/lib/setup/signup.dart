import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:newfirebaseproject/pages/home.dart';
import 'package:newfirebaseproject/setup/signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  bool passwordstate;
  static int aa = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("Sign Up"),
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
                  obscureText: false,
                ),
              ),
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    setState(() {
                      // debugPrint(
                      // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

                      signUp();
                    });
                  })
            ],
          ),
        ));
  }

  Future<void> signUp() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          debugPrint(
              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

          return LoginPage();
        }));
      } catch (e) {
        debugPrint(
            "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        print(e.message);
      }
    }
  }
}
