import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/servicers/crud/crud.dart';

class AddForm extends StatefulWidget {
  // bool isdoc = true;
  AddForm({Key key, this.user}) : super(key: key);
  FirebaseUser user;

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  TextEditingController tec = TextEditingController();
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  TextEditingController tec3 = TextEditingController();
  TextEditingController tec4 = TextEditingController();
  String a;
  CrudMethod crudObj = CrudMethod();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String title, description, author, treatments = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.a = gettera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add an Article"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (String input) {
                  this.author = input;
                },
                initialValue: "Unknown",
                controller: tec4,
                decoration: InputDecoration(
                    labelText: 'Author Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (String input) {
                  this.title = input;
                },
                controller: tec,
                decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 200.0,
                child: TextFormField(
                  onSaved: (String input) {
                    this.description = input;
                  },
                  controller: tec1,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
            ),
            authorizedAccess(context),
            Row(
              children: <Widget>[
                Container(
                  width: 150,
                ),
                FlatButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // debugPrint(authorizedAccess(context));
                  },
                  child: Text("Cancel"),
                  textColor: Colors.blue,
                ),
                Container(),
                FlatButton(
                  onPressed: () {
                    final formstate = _formkey.currentState;
                    formstate.save();
                    // Navigator.of(context).pop();
                    Map<String, dynamic> data = {
                      'title': this.title,
                      'description': this.description,
                      'treatments': this.treatments,
                      'author': this.author,
                    };
                    crudObj.adData(data, 'dieseaseArticles').then((result) {
                      dialogTrigger(context);
                      // debugPrint("a" * 1000);0
                      // dialogTrigger(context);
                    }).catchError((e) {
                      print(e);
                    });
                  },
                  child: Text("Save"),
                  textColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget gettextfield(isdoc_) {
    // debugPrint(FirebaseAuth.instance.currentUser());
    setState(() {
      if (isdoc_) {
        debugPrint(
            "TRUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUE");
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (String input) {
                  this.treatments = input;
                },
                controller: tec2,
                decoration: InputDecoration(
                    labelText: 'Treatments',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
          ],
        );
      } else {
        debugPrint(
            "FalSEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
        return Container();
      }
    });
  }

  Future<bool> dialogTrigger(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Sucessfully Added",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            content: Text("Your diease article has been added."),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget buildtext(BuildContext context) {
    return
        //  Container(
        //   child:
        StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
          .collection('users')
          .document(widget.user.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return checkRole(snapshot.data);
        }
        return LinearProgressIndicator();
      },
      // ),
    );
  }

  Widget checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data == null) {
      return Center(
        child: Text(
            'Click save to add the article; click cancel to go to dashpage.'),
      );
    }
    if (snapshot.data['regnum'] == '') {
      return Container();
    } else {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onSaved: (String input) {
                this.treatments = input;
              },
              controller: tec2,
              decoration: InputDecoration(
                  labelText: 'Treatments',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ],
      );
    }
  }

  authorizedAccess(BuildContext context) {
    // debugPrint(this.a + " " + "klklkl" * 100);
    if (this.a == '') {
      return Container();
    } else {
      // debugPrint("Notadmin" * 100);
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onSaved: (String input) {
                this.treatments = input;
              },
              controller: tec2,
              decoration: InputDecoration(
                  labelText: 'Treatments',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ],
      );
    }
  }

  String gettera() {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('/users')
          .where('uid', isEqualTo: user.uid)
          .getDocuments()
          .then((docs) {
        if (docs.documents[0].exists) {
          return docs.documents[0].data['regnum'];
        }
      });
    });
  }
}
