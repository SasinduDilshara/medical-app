import 'package:databaseconnectingapp/screens/note_detail.dart';
import 'package:databaseconnectingapp/screens/notelist.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: NoteList(),
    );
  }
}
