// import 'package:firebaseproject/pages/home.dart';
import 'package:firebaseextend/pages/dashpage.dart';
import 'package:firebaseextend/pages/home.dart';
import 'package:firebaseextend/pages/loginpage.dart';
import 'package:firebaseextend/pages/signuppage.dart';
import 'package:firebaseextend/servicers/usermanagement.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserManagement().handleAuth(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/signup': (BuildContext context) => SignupPage(),
        '/homepage': (BuildContext context) => Home(),
      },
    );
  }
}
