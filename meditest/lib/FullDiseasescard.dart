import "package:flutter/material.dart";

class FullDiseasescard extends StatelessWidget {
  final int index;
  final String name;
  final String author;
  final String description;
  final String treatment;

// final String type;
// const Diseasescard();
  const FullDiseasescard(
      this.index, this.name, this.author, this.description, this.treatment);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightBlue[200],
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //       Text(
                //               "Image",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 08,
                //               ),
                //       ),
                // Positioned(
                //           child: Padding(
                //             padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                //             child: Text(
                //               "Image",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 28,
                //               ),
                //             ),
                //           ),
                //           bottom: 0,
                //         )

                Text(
                  this.name,
                  style: TextStyle(
                    color: Colors.white,
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
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.description,
                  style: TextStyle(
                    color: Colors.white,
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
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
          ],
        ));
  }
}
