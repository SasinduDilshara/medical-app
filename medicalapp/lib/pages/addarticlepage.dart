// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/servicers/crud/crud.dart';

class AddForm extends StatefulWidget {
  // bool isdoc = true;
  AddForm({Key key, this.user, this.type}) : super(key: key);
  FirebaseUser user;
  bool type;

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  TextEditingController tec = TextEditingController();
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  TextEditingController tec3 = TextEditingController();
  TextEditingController tec4 = TextEditingController();
  String reg;
  CrudMethod crudObj = CrudMethod();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String title, description, author, treatments = '';

  @override
  void initState() {
    super.initState();
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
                // initialValue: "Unknown",
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
            // gettera(),
            gettext(widget.type),
            Row(
              children: <Widget>[
                Container(
                  width: 150,
                ),
                FlatButton(
                  onPressed: () {
                    // String regnum =
                    //     await crudObj.getUserFieldData('regnum', context);
                    // debugPrint(regnum);
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

  Widget gettext(bool istrue) {
    if (istrue) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 200.0,
          child: TextFormField(
            onSaved: (String input) {
              this.treatments = input;
            },
            controller: tec3,
            decoration: InputDecoration(
                labelText: 'Treatments',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0))),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
