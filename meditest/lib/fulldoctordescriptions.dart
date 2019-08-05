import "package:flutter/material.dart";
import "doctorcard.dart";

class FullDoctorDescription extends StatelessWidget {
  // final int index;
  final DoctorCard doctorcard;
  final String qualifications;
  final String comments;

  const FullDoctorDescription(
      this.doctorcard, this.qualifications, this.comments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(this.doctorcard.name),
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
                  child: Text("          " + this.doctorcard.description * 10,
                      style: TextStyle(fontSize: 14)
                      // this.doctorcard.author,
                      )),
            ),
            Text(
              " qualifications                                                           ",
              style: TextStyle(fontSize: 19, color: Colors.red[800]),
            ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.doctorcard.description * 6,
                    style: TextStyle(fontSize: 14)
                    // this.doctorcard.author,
                    )),

            Text(
                "   " +
                    "Working Hospitals" +
                    "                                                                                   ",
                style: TextStyle(color: Colors.red[900], fontSize: 19)
                // this.doctorcard.author,
                ),
            // ),
            Container(
                height: 60.0,
                width: 500.0,
                color: Colors.yellow,
                child: Text(this.doctorcard.hospitals,
                    style: TextStyle(fontSize: 14)
                    // this.doctorcard.author,
                    )),

            Text(
                "   " +
                    "Comments" +
                    "                                                                                   ",
                style: TextStyle(color: Colors.red[900], fontSize: 19)
                // this.doctorcard.author,
                ),
            // ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.doctorcard.description * 3,
                    style: TextStyle(fontSize: 14)
                    // this.doctorcard.author,
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
