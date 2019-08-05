import "package:flutter/material.dart";
import "dispensarycard.dart";

class FullDispensaryDescription extends StatelessWidget {
  // final int index;
  final DispensaryCard dispensarycard;
  final String doctors;
  final String comments;

  const FullDispensaryDescription(
      this.dispensarycard, this.doctors, this.comments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(this.dispensarycard.name),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Card(
                  color: Colors.yellow,
                  child: Text(
                      "          " + this.dispensarycard.description * 10,
                      style: TextStyle(fontSize: 14)
                      // this.dispensarycard.author,
                      )),
            ),
            Text(
              " doctors                                                           ",
              style: TextStyle(fontSize: 19, color: Colors.red[800]),
            ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.dispensarycard.description * 6,
                    style: TextStyle(fontSize: 14)
                    // this.dispensarycard.author,
                    )),

            Text(
                "   " +
                    "Comments" +
                    "                                                                                   ",
                style: TextStyle(color: Colors.red[900], fontSize: 19)
                // this.dispensarycard.author,
                ),
            // ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.dispensarycard.description * 3,
                    style: TextStyle(fontSize: 14)
                    // this.dispensarycard.author,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()),
            );
          },
          icon: Text(
            "+",
            style: TextStyle(fontSize: 25, color: Colors.yellow),
          ),
        ),
      ),
    );
  }
}
