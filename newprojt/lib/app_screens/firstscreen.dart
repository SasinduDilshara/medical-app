import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      "Hello Flutter ${generateNum()}",
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.blue, fontSize: 40),
    )));
  }

  int generateNum() {
    var random = Random();
    int num = random.nextInt(8);
    return num;
  }
}
