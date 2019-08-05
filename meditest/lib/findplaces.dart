import 'package:flutter/material.dart';
import 'package:meditest/SearchPlaces.dart';
import 'package:meditest/pharmacycard.dart';
import "SearchPlaces.dart";
import 'dispensarycard.dart';
import "doctorcard.dart";
//  import 'package:android_intent/android_intent.dart';

class FindPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Find the Nearest \n           Medical Centers"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(7.0),
          ),
          Container(
            width: 2000,
            height: 150.0,
            color: Colors.blue[100],
            child: SearchPlaces(),

            //  Column(
            //   children: <Widget>[
            //     Text(
            //         "Turn on your Location to search the nearest medical centers in your Area\n",
            //         style: TextStyle(
            //           fontSize: 20,
            //         )),
            //     Card(
            //       color: Colors.blue[100],
            //       child: FlatButton(
            //         child: Text(
            //           "Turn on Location",
            //           style: TextStyle(
            //             color: Colors.blue,
            //           ),
            //         ),
            //         // onPressed: openLocationSetting
            //         onPressed: () {},
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Container(
            //must be a card
            // color: Colors.amber,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                DoctorCard(
                    1,
                    "Sasindu",
                    "I am a specialist doctor about .......................................................",
                    "Nawaloka Hospital\nLanka Hospitals\nAsiri Hospital"),
                DoctorCard(
                    1,
                    "Sasindu",
                    "I am a specialist doctor about .......................................................",
                    "Nawaloka Hospital\nLanka Hospitals\nAsiri Hospital"),
                DoctorCard(
                    1,
                    "Sasindu",
                    "I am a specialist doctor about .......................................................",
                    "Nawaloka Hospital\nLanka Hospitals\nAsiri Hospital"),
                DoctorCard(
                    1,
                    "Sasindu",
                    "I am a specialist doctor about .......................................................",
                    "Nawaloka Hospital\nLanka Hospitals\nAsiri Hospital"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.1),
            height: 170.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                PharmacyCard(
                    1,
                    "Aloka Pharmacy",
                    "This is a pharmacy situated near to the Dematagoda railway staiton",
                    "Dematagoda"),
                PharmacyCard(
                    1,
                    "Aloka Pharmacy",
                    "This is a pharmacy situated near to the Dematagoda railway staiton",
                    "Dematagoda"),
                PharmacyCard(
                    1,
                    "Aloka Pharmacy",
                    "This is a pharmacy situated near to the Dematagoda railway staiton",
                    "Dematagoda"),
                PharmacyCard(
                    1,
                    "Aloka Pharmacy",
                    "This is a pharmacy situated near to the Dematagoda railway staiton",
                    "Dematagoda"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.1),
            height: 170.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                DispensaryCard(
                    1,
                    "Suwasewana Dispensary",
                    "This is a Dispensary situated near to the Pettah railway staiton",
                    "Pettah"),
                DispensaryCard(
                    1,
                    "Suwasewana Dispensary",
                    "This is a Dispensary situated near to the Pettah railway staiton",
                    "Pettah"),
                DispensaryCard(
                    1,
                    "Suwasewana Dispensary",
                    "This is a Dispensary situated near to the Pettah railway staiton",
                    "Pettah"),
                DispensaryCard(
                    1,
                    "Suwasewana Dispensary",
                    "This is a Dispensary situated near to the Pettah railway staiton",
                    "Pettah"),
              ],
            ),
          ),
        ],
      )),
    );
  }

//  void openLocationSetting() async {
//    final AndroidIntent intent = new AndroidIntent(
//      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
//      );
//      await intent.launch();
//    }
}
