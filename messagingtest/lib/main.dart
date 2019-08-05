import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:fulltext_search/searchservice.dart';s
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toLowerCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Firestore search'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          child: Center(
              child: Text(
        data['name'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ))));
}

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('testsearch')
        .where('searchkey',
            isEqualTo: searchField.substring(0, 1).toLowerCase())
        .getDocuments();
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:messagingtest/reviews.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Homee(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var reviews;
//   bool reviewFlag = false;

//   @override
//   void initState() {
//     setState(() {
//       super.initState();
//       Reviewservice()
//           .getlatestReview('sasindu', '9112567676')
//           .then((dynamic docs) {
//         if (docs.documents.isNotEmpty) {
//           reviewFlag = true;
//           reviews = docs.documents[0].data;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: <Widget>[
//             FlatButton(
//               child: Text("State"),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Scaffold();
//                 }));
//               },
//             )
//           ],
//           title: Text("Home"),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Material(
//                 elevation: 7.0,
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                       height: 300.0,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Reviews",
//                               style: TextStyle(fontSize: 17.0),
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Container(
//                               height: 0.5,
//                               width: double.infinity,
//                               color: Colors.red,
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Text(
//                               "Latest Reviews",
//                               style: TextStyle(fontSize: 14.0),
//                             ),
//                             SizedBox(
//                               height: 45.0,
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 reviewFlag
//                                     ? Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Column(
//                                             children: <Widget>[
//                                               Text(reviews['reviewer']),
//                                               Text(reviews['reviewmode']),
//                                             ],
//                                           )
//                                         ],
//                                       )
//                                     : Text("Not done")
//                               ],
//                             )
//                           ])),
//                 )),
//           ),
//         ));
//   }
// }

// class Homee extends StatefulWidget {
//   @override
//   _HomeeState createState() => _HomeeState();
// }

// class _HomeeState extends State<Homee> {
//   var queryResultSet = [];
//   var tempSearchStore = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FireStore search"),
//       ),
//       body: ListView(
//         children: <Widget>[
//           TextField(
//             onChanged: (val) {
//               initiateSearch(val);
//             },
//             decoration: InputDecoration(
//                 prefixIcon: IconButton(
//                   color: Colors.black,
//                   icon: Icon(Icons.arrow_back),
//                   iconSize: 20.0,
//                   onPressed: () {
//                     // Navigator.of(context).pop();
//                   },
//                 ),
//                 hintText: "Search",
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(7.0))),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.count(
//               scrollDirection: Axis.horizontal,
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: false,
//               children: tempSearchStore.map((element, index) {
//                 debugPrint((element['name'] + " ") * 1000);
//                 return buildcard(element);
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildcard(data) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
//       elevation: 2.0,
//       child: Container(
//         child: Center(
//           child: Text(data['name']),
//         ),
//       ),
//     );
//   }

//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }
//     var capitalization =
//         value.substring(0, 1).toLowerCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchServices()
//           .searchByName(value, 'testsearch')
//           .then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.documents.length; ++i) {
//           queryResultSet.add(docs.documents[i].data);
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['name'].startswith(capitalization) || true) {
//           setState(() {
//             debugPrint((element['name'] + " x ") * 1000);
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }
// }

// class SearchServices {
//   searchByName(String search, String coll) {
//     return Firestore.instance
//         .collection(coll)
//         .where('searchkey', isEqualTo: search.substring(0, 1).toLowerCase())
//         .getDocuments();
//   }
// }
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var queryResultSet = [];
//   var tempSearchStore = [];

//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }

//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.documents.length; ++i) {
//           queryResultSet.add(docs.documents[i].data);
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['businessName'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: Text('Firestore search'),
//         ),
//         body: ListView(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextField(
//               onChanged: (val) {
//                 initiateSearch(val);
//               },
//               decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     color: Colors.black,
//                     icon: Icon(Icons.arrow_back),
//                     iconSize: 20.0,
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   contentPadding: EdgeInsets.only(left: 25.0),
//                   hintText: 'Search by name',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.0))),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           GridView.count(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: true,
//               children: tempSearchStore.map((element) {
//                 return buildResultCard(element);
//               }).toList())
//         ]));
//   }
// }

// Widget buildResultCard(data) {
//   return Card(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//     elevation: 2.0,
//     child: Container(
//       child: Center(
//         child: Text(data['businessName'],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//         )
//       )
//     )
//   );
// }
