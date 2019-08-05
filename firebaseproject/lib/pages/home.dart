import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/pages/dashpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoard()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are logged in"),
            OutlineButton(
              child: Text("logout"),
              borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 3.0),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((onvalue) {
                  Navigator.of(context).pushReplacementNamed('/landingpage');
                }).catchError((onError) {
                  print(onError);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
