import 'package:sedkit/pages/setup/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //primaryColor: Color(0xFFA2A2A6)
      ),
      home: WelcomePage(),
    );
  }
} 