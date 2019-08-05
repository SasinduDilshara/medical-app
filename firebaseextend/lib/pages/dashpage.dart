// import 'package:firebaseproject/servicers/crud/crud.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DashBoard extends StatefulWidget {
//   @override
//   _DashBoardState createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   String carmodel;
//   String carcolor;
//   QuerySnapshot cars;
//   CrudMethod crudObj = new CrudMethod();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         title: Text("DashBoard"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               addDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               setState(() {
//                 crudObj.getttData().then((results) {
//                   cars = results;
//                 });
//               });
//             },
//           ),
//         ],
//       ),
//       body: carList(),
//     );
//   }

//   Future<bool> addDialog(BuildContext context) async {
//     debugPrint("a" * 1000);
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Add Data", style: TextStyle(fontSize: 15.0)),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   decoration: InputDecoration(hintText: "Enter a car name:- "),
//                   onChanged: (value) {
//                     carmodel = value;
//                   },
//                 ),
//                 TextField(
//                   decoration: InputDecoration(hintText: "Enter a car color:- "),
//                   onChanged: (value) {
//                     carcolor = value;
//                   },
//                 )
//               ],
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("add"),
//                 textColor: Colors.blue,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Map<String, dynamic> cardata = {
//                     'carname': this.carmodel,
//                     'color': this.carcolor
//                   };
//                   crudObj.adData(cardata).then((result) {
//                     // debugPrint("a" * 1000);
//                     dialogTrigger(context);
//                   }).catchError((e) {
//                     print(e);
//                   });
//                 },
//               )
//             ],
//           );
//         });
//   }

//   Future<bool> dialogTrigger(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(
//               "job done",
//               style: TextStyle(fontSize: 15),
//             ),
//             content: Text("added"),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('alright'),
//                 textColor: Colors.blue,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   Future<bool> updateDialog(BuildContext context, selectedDoc) async {
//     // debugPrint("a" * 1000);
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("updte Data", style: TextStyle(fontSize: 15.0)),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   decoration: InputDecoration(hintText: "Enter a car name:- "),
//                   onChanged: (value) {
//                     carmodel = value;
//                   },
//                 ),
//                 TextField(
//                   decoration: InputDecoration(hintText: "Enter a car color:- "),
//                   onChanged: (value) {
//                     carcolor = value;
//                   },
//                 )
//               ],
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("add"),
//                 textColor: Colors.blue,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   crudObj.updateData(selectedDoc, {
//                     'carname': this.carmodel,
//                     'color': this.carcolor
//                   }).then((result) {
//                     // debugPrint("a" * 1000);
//                     dialogTrigger(context);
//                   }).catchError((e) {
//                     print(e);
//                   });
//                 },
//               )
//             ],
//           );
//         });
//   }

//   @override
//   void initState() {
//     setState(() {
//       crudObj.getttData().then((results) {
//         cars = results;
//       });
//     });
//   }

//   Widget carList() {
//     if (cars != null) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: cars.documents.length,
//           itemBuilder: (context, i) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 onTap: () {
//                   updateDialog(context, cars.documents[i].documentID);
//                 },
//                 title: Text(cars.documents[i]['carname']),
//                 subtitle: Text(
//                   cars.documents[i]['color'],
//                 ),
//                 leading: Icon(Icons.camera),
//               ),
//             );
//           },
//         ),
//       );
//     } else {
//       Text("loading");
//     }
//   }
// }

import 'package:firebaseextend/servicers/crud/crud.dart';
import 'package:firebaseextend/servicers/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'allusers.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  UserManagement um = UserManagement();
  String carmodel;
  String carcolor;
  Stream cars;
  CrudMethod crudObj = new CrudMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sasindu"),
              accountEmail: Text("email"),
            ),
            ListTile(
              title: Text("About Page"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Allusers();
                }));
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                um.signOut(context);
              },
            ),
            ListTile(
              title: Text("AAdminPage"),
              onTap: () {
                um.authorizedAccess(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("DashBoard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                crudObj.getData().then((results) {
                  cars = results;
                });
              });
            },
          ),
        ],
      ),
      body: carList(),
    );
  }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    // debugPrint("a" * 1000);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("updte Data", style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "Enter a car name:- "),
                  onChanged: (value) {
                    carmodel = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter a car color:- "),
                  onChanged: (value) {
                    carcolor = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Update"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'carname': this.carmodel,
                    'color': this.carcolor
                  }).then((result) {
                    // debugPrint("a" * 1000);
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> addDialog(BuildContext context) async {
    debugPrint("a" * 1000);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Data", style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "Enter a car name:- "),
                  onChanged: (value) {
                    carmodel = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter a car color:- "),
                  onChanged: (value) {
                    carcolor = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("add"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  Map<String, dynamic> cardata = {
                    'carname': this.carmodel,
                    'color': this.carcolor
                  };
                  crudObj.adData(cardata).then((result) {
                    // debugPrint("a" * 1000);
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "job done",
              style: TextStyle(fontSize: 15),
            ),
            content: Text("added"),
            actions: <Widget>[
              FlatButton(
                child: Text('alright'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    setState(() {
      crudObj.getData().then((results) {
        cars = results;
      });
    });
  }

  carList() {
    setState(() {
      crudObj.getData().then((results) {
        cars = results;
      });
    });
    if (cars != null) {
      return StreamBuilder(
        stream: cars,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onLongPress: () {
                      crudObj.deletedata(snapshot.data.documents[i].documentID);
                    },
                    onTap: () {
                      updateDialog(
                          context, snapshot.data.documents[i].documentID);
                    },
                    title: Text(snapshot.data.documents[i]['carname']),
                    subtitle: Text(
                      snapshot.data.documents[i]['color'],
                    ),
                    leading: Icon(Icons.camera),
                  ),
                );
              },
            ),
          );
        },
      );
    } else {
      Text("loading");
    }
  }
}
