import 'package:cloud_firestore/cloud_firestore.dart';

class Reviewservice {
  getlatestReview(String cliename, String clientcontact) {
    return Firestore.instance
        .collection('reviews')
        .where('clientname', isEqualTo: cliename)
        .where('clientcontact', isEqualTo: clientcontact)
        .getDocuments();
  }

//snap
  getllatestReview(String cliename, String clientcontact) {
    return Firestore.instance
        .collection('reviews')
        .where('clientname', isEqualTo: cliename)
        .where('clientcontact', isEqualTo: clientcontact)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
