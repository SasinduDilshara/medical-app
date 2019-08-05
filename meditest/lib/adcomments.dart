import 'package:flutter/material.dart';

class AddCommentsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Your Name:-'),
            ),
          ),
          Card(
            child: TextField(
              style: new TextStyle(
                  // fontSize: 5.0,
                  // height: 3.0,
                  color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Comment:-'),
            ),
          ),
          FlatButton(
            child: Text(
              "ADD                                                                                                                                                                                    ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              // _launchURL('Dispensary');
            },
          ),
        ],
      ),

      appBar: new AppBar(
        title: new Text('Comment'),
      ),

//       TextFormField(
//   decoration: InputDecoration(
//     labelText: 'Enter your username'
//   ),
// ),
    );
  }
}
