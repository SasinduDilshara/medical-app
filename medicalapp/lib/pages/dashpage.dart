import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:medicalapp/servicers/crud/crud.dart';

import 'addarticlepage.dart';
import 'dieseasespage.dart';

class LogingHome extends StatefulWidget {
  const LogingHome({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _LogingHomeState createState() => _LogingHomeState();
}

class _LogingHomeState extends State<LogingHome> {
  CrudMethod crudObj = CrudMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getImage("images/doctors.jpg"),
                  )),
              ListTile(
                title: Text("My Profile"),
                subtitle: Text("Tap here to see your details"),
                onTap: () {},
                onLongPress: () {},
              ),
              ListTile(
                title: Text("Saved Articles"),
                subtitle: Text("Tap here to see your saved articles"),
                onTap: () {},
                onLongPress: () {},
              ),
              ListTile(
                title: Text("Save Contact"),
                subtitle: Text("Tap here to see your saved contactsx"),
                onTap: () {},
                onLongPress: () {},
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Log out"),
                onPressed: () {
                  crudObj.signOut(context);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Medi Advisor"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.web),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.book),
          onPressed: () {
            // debugPrint(widget.user.email);
            crudObj.getTreatmentText('regnum', context);
          },
          tooltip: "Click here to add a article",
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            getNoteListView(),
          ],
        )));
  }

  Widget getNoteListView() {
    // TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Container(
            // height: 250,
            // width: 250,
            color: Colors.indigo[400],
            child: Row(children: <Widget>[
              Expanded(
                  child: Card(
                color: Colors.indigo[900],
                child: getImage("images/dengue.jpg"),
              )),
              Expanded(
                // Card()
                child: Column(
                  children: <Widget>[
                    Text(
                      "Get know about  \n        Dieases",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                    Container(height: 10.0),
                    Text(
                      "Click here to discover about dieases",
                      style: TextStyle(fontSize: 17),
                    ),
                    Container(height: 14.0),
                    FlatButton(
                      textColor: Colors.blue[50],
                      onPressed: () {
                        navigate(DieseasePage());
                      },
                      child: Text("                   Click Here"),
                    )
                  ],
                ),
              )
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              color: Colors.grey,
              child: Row(children: <Widget>[
                Expanded(
                    child: Card(
                  color: Colors.grey,
                  child: getImage("images/symptoms.jpeg"),
                )),
                Expanded(
                  // Card()
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Search For  \n  Symptoms",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Container(height: 10.0),
                      Text(
                        "Click here to recognize dieseases via symptoms",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(height: 14.0),
                      FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          navigate(Scaffold());
                        },
                        child: Text("                 Click Here"),
                      )
                    ],
                  ),
                )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              color: Colors.green[300],
              child: Row(children: <Widget>[
                Expanded(
                    child: Card(
                  color: Colors.green,
                  child: getImage("images/medicalcenter.jpg"),
                )),
                Expanded(
                  // Card()
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Nearest\n Medical Centers",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Container(height: 10.0),
                      Text(
                        "Click here to recognize dieseases via symptoms",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(height: 14.0),
                      FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          navigate(Scaffold());
                        },
                        child: Text("                 Click Here"),
                      )
                    ],
                  ),
                )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              color: Colors.blue[300],
              child: Row(children: <Widget>[
                Expanded(
                    child: Card(
                  color: Colors.blue,
                  child: getImage("images/doctors.jpg"),
                )),
                Expanded(
                  // Card()
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Meet Your Doctor",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Container(height: 10.0),
                      Text(
                        "Click here to meet doctors online ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(height: 14.0),
                      FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          navigate(Scaffold());
                        },
                        child: Text("                 Click Here"),
                      )
                    ],
                  ),
                )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              color: Colors.red[300],
              child: Row(children: <Widget>[
                Expanded(
                    child: Card(
                  color: Colors.red,
                  child: getImage("images/medicine.jpg"),
                )),
                Expanded(
                  // Card()
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Know about prescription",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Container(height: 10.0),
                      Text(
                        "Click here to know about prescriptionss",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(height: 14.0),
                      FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          navigate(Scaffold());
                        },
                        child: Text("                 Click Here"),
                      )
                    ],
                  ),
                )
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              color: Colors.black54,
              child: Row(children: <Widget>[
                Expanded(
                    child: Card(
                  color: Colors.black54,
                  child: getImage("images/us.jpeg"),
                )),
                Expanded(
                  // Card()
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Team Medi Advisor",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Container(height: 10.0),
                      Text(
                        "Click here to know more about us",
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(height: 14.0),
                      FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          navigate(Scaffold());
                        },
                        child: Text("                 Click Here"),
                      )
                    ],
                  ),
                )
              ])),
        ),
      ]),
    );
  }

  Widget getImage(String link) {
    AssetImage asim = AssetImage(link);

    Image im = Image(
      image: asim,
      width: 150.0,
      height: 200.0,
      fit: BoxFit.cover,
    );
    return Container(
      // color: Colors.white,
      // padding: EdgeInsets.all(20.0),
      // child: Center(
      child: im,
      // )
    );
  }

  navigate(Widget wid) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return wid;
    }));
  }
}
