import 'package:flutter/material.dart';
import 'package:medicalapp/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Medi Advisor',
      theme: ThemeData(
        primaryColor: Colors.blue,
        // colorScheme: Colors.lightBlue[50],
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
