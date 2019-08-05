import "package:flutter/material.dart";

Widget _buildButton(BuildContext context, String text , Widget widget) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      // onPressed: () {
        onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget),);
      },
        // Navigator.push(
            // context, MaterialPageRoute(builder: (context) => SecondScreen()));
      // },
    );
  }
