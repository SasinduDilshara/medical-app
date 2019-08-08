import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
