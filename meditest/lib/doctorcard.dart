import "package:flutter/material.dart";

import 'fulldoctordescriptions.dart';

class DoctorCard extends StatelessWidget {
  final int index;
  final String name;
  final String description;
  final String hospitals;
  final String place;

  const DoctorCard(this.index, this.name, this.description, this.hospitals,
      {this.place = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
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
                        FullDoctorDescription(this, "jkjk", "hhjhjhh"),
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
