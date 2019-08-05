import "package:flutter/material.dart";
import "pharmacycard.dart";

class FullPharmacyCardDescription extends StatelessWidget {
  // final int index;
  final PharmacyCard pharmacyCard;
  final String doctors;
  final String comments;

  const FullPharmacyCardDescription(
      this.pharmacyCard, this.doctors, this.comments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(this.pharmacyCard.name),
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
                  child: Text("          " + this.pharmacyCard.description * 10,
                      style: TextStyle(fontSize: 14)
                      // this.pharmacyCard.author,
                      )),
            ),
            Text(
              " doctors                                                           ",
              style: TextStyle(fontSize: 19, color: Colors.red[800]),
            ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.pharmacyCard.description * 6,
                    style: TextStyle(fontSize: 14)
                    // this.pharmacyCard.author,
                    )),

            Text(
                "   " +
                    "Comments" +
                    "                                                                                   ",
                style: TextStyle(color: Colors.red[900], fontSize: 19)
                // this.pharmacyCard.author,
                ),
            // ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.pharmacyCard.description * 3,
                    style: TextStyle(fontSize: 14)
                    // this.pharmacyCard.author,
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
