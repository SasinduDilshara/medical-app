import "package:flutter/material.dart";

import 'FullDescription.dart';

class Diseasescard extends StatelessWidget {
  final int index;
  final String name;
  final String author;
  final String description;

  const Diseasescard(this.index, this.name, this.author, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  this.name,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.author,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.description.substring(0, 40),
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            FlatButton(
              child: Text(
                "ReadMore...",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullDescription(this, "jkjk", "hhjhjhh"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // )
    );
  }
}
