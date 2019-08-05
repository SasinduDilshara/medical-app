import "package:flutter/material.dart";
import "diseasecard.dart";
import "adcomments.dart";

class FullDescription extends StatelessWidget {
  // final int index;
  final Diseasescard diseasecard;
  final String treatments;
  final String comments;

  const FullDescription(this.diseasecard, this.treatments, this.comments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(this.diseasecard.name + " By " + this.diseasecard.author),
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
            // Card(
            //   child:
            // Text(
            //   "          "+this.diseasecard.author,
            //   style: TextStyle(

            //     fontSize: 24
            //   )
            //   // this.diseasecard.author,
            //   )
            //   ,
            // ),
            SingleChildScrollView(
              child: Card(
                  color: Colors.yellow,
                  child: Text("          " + this.diseasecard.description * 100,
                      style: TextStyle(fontSize: 14)
                      // this.diseasecard.author,
                      )),
            ),
            // Card(color: Colors.lightBlue,
            //   child:
            Text(
              " Treatments                                                           ",
              style: TextStyle(fontSize: 19, color: Colors.red[800]),
            ),
            // ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.diseasecard.description * 6,
                    style: TextStyle(fontSize: 14)
                    // this.diseasecard.author,
                    )),

            // Card(color:Colors.orange,
            //   child:
            Text(
                "   " +
                    "Comments" +
                    "                                                                                   ",
                style: TextStyle(color: Colors.red[900], fontSize: 19)
                // this.diseasecard.author,
                ),
            // ),
            Card(
                color: Colors.yellow,
                child: Text("          " + this.diseasecard.description * 3,
                    style: TextStyle(fontSize: 14)
                    // this.diseasecard.author,
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
              MaterialPageRoute(builder: (context) => (AddCommentsForm())),
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
