import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/pages/addarticlepage.dart';
import 'package:medicalapp/pages/dashpage.dart';
import 'package:medicalapp/pages/loginpage.dart';

class CrudMethod {
  bool isLogged() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

/* This is work*/
  Future<void> adData(cardata, String collec) async {
    // debugPrint("a" * 1000);
    if (isLogged()) {
      Firestore.instance.collection(collec).add(cardata).catchError((onError) {
        print(onError);
      });
    } else {
      AlertDialog(title: Text("You must Logged in"));
    }
  }

  getTreatmentText(String field, BuildContext context) async {
    //'dieseaseArticles'

    var user = await FirebaseAuth.instance.currentUser();
    var userQuery = Firestore.instance
        .collection('users')
        .where('email', isEqualTo: user.email)
        .limit(1);
    userQuery.getDocuments().then((data) async {
      // if (data.documents.length > 0) {
      var regnum = await data.documents[0].data[field];
      if (regnum == '' || regnum == null) {
        navigate(
            AddForm(
              user: user,
              type: false,
            ),
            context);
      } else {
        navigate(
            AddForm(
              user: user,
              type: true,
            ),
            context);
      }

      // }
    });
// Future.delayed(duration:4);
    // await Future.delayed(const Duration(seconds: 5));
    /*stream*/
  }

  getData() async {
    return await Firestore.instance
        .collection('dieseaseArticles')
        .snapshots(); /*stream*/
  }

  getttData() async {
    return await Firestore.instance
        .collection('dieseaseArticles')
        .getDocuments();
  }

  Future<void> addData(cardata) async {
    // debugPrint("a" * 1000);
    if (isLogged()) {
      Firestore.instance.runTransaction((Transaction crudtransaction) async {
        CollectionReference ref =
            await Firestore.instance.collection('dieseaseArticles');
        ref.add(cardata);
      });
    } else {
      AlertDialog(title: Text("You must Logged in"));
    }
  }

  updateData(selectedDoc, newValues) {
    Firestore.instance
      ..collection('testcrud')
          .document(selectedDoc)
          .updateData(newValues)
          .catchError((onError) {
        print(onError);
      }); /* selected doc is a id of the doc */
  }

  deletedata(docId) {
    Firestore.instance
      ..collection('testcrud').document(docId).delete().catchError((onError) {
        print(onError);
      });
  }

  navigate(Widget wid, BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return wid;
    }));
  }

  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((onvalue) {
      navigate(LoginPage(), context);
    }).catchError((onError) {
      print(onError);
    });
  }
}
