import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebaseextend/pages/adminonly.dart';
// import 'package:firebaseextend/pages/dashpage.dart';
// import 'package:firebaseextend/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicalapp/pages/dashpage.dart';

class UserManagement {
  storeNewUser(user, context, regnum, country) {
    Firestore.instance.collection('users').add({
      'email': user.email,
      'uid': user.uid,
      'country': country,
      'regnum': regnum
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LogingHome();
      }));
    }).catchError((onError) {
      print(onError);
    });
  }

  Widget handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold();
          }
          return Scaffold();
        });
  }

  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((onvalue) {
      Navigator.of(context).pushReplacementNamed('/landingpage');
    }).catchError((onError) {
      print(onError);
    });
  }

  authorizedAccess(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('/users')
          .where('uid', isEqualTo: user.uid)
          .getDocuments()
          .then((docs) {
        if (docs.documents[0].exists) {
          if (docs.documents[0].data['role'] == 'admin') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return LogingHome();
            }));
          } else {
            // debugPrint("Notadmin" * 100);
          }
        }
      });
    });
  }
}
