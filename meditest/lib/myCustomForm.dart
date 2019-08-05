import 'package:flutter/material.dart';

class AddArticleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter the Disease Name:-'),
            ),
          ),
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
                  border: InputBorder.none, hintText: 'Enter Description:-'),
            ),
          ),
          Card(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter treatments:-'),
            ),
          ),
          FlatButton(
            child: Text(
              "                                                                               ADD                                                                                                                                                                                    ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                // fontWeight: 10ps,
              ),
            ),
            onPressed: () {
              // _launchURL('Dispensary');
            },
          ),
        ],
      ),

      appBar: new AppBar(
        title: new Text('New Article'),
      ),

//       TextFormField(
//   decoration: InputDecoration(
//     labelText: 'Enter your username'
//   ),
// ),
    );
  }
}
