import 'package:flutter/material.dart';
import 'package:medicalapp/pages/dieseasespage.dart';
import 'package:medicalapp/pages/loginpage.dart';
import 'package:medicalapp/pages/signup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Column(
            children: <Widget>[],
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
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 180.0,
                  height: 0.0,
                ),
                RaisedButton(
                  onPressed: () {
                    navigate(LoginPage());
                  },
                  child: Text("Login"),
                  color: Colors.red[300],
                  elevation: 7.0,
                  disabledColor: Colors.red[100],
                ),
                Container(height: 0.0, width: 1.5),
                RaisedButton(
                  onPressed: () {
                    navigate(SignupPage());
                  },
                  child: Text("Sign Up"),
                  color: Colors.grey[400],
                  elevation: 100.0,
                  disabledColor: Colors.grey[900],
                ),
              ],
            ),
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
                          dialogTrigger(context);
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

  Future<bool> dialogTrigger(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Please Sign In",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            content: Text("You need to sign in to get the service."),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Container(
                width: 65.0,
                height: 0.0,
              ),
              FlatButton(
                child: Text('Sign in or Log in'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  navigate(LoginPage());
                },
              ),
            ],
          );
        });
  }
}
