import 'package:flutter/material.dart';
import "diseasecard.dart";
import "SymptomsPage.dart";

import "ClickBody.dart";
import 'findplaces.dart';

class Body extends StatelessWidget {
  // const Body(this.state)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              // Image.network(

              //         // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbEGFBG4Lj117ZRBMgTiPGvrmNOnusllg__ZvclNiB3l37bI19iQ",
              //         fit: BoxFit.cover,
              //       ),
              Column(
                children: <Widget>[
                  // CustomScrollView(slivers: <Widget>[

                  // Checkbox(
                  //   value: false,
                  //   // onChanged: (),
                  //   // onChanged: (){},
                  // ),
                  // TextBox.fromLTRBD(2, top, right, bottom, direction),
                  Buttons(),

                  // for (var item in [1,2,3])
                ],
              ),
            ],
          ),
        )
        // ],)

        // color: Colors.orange,
        );

    // import 'package:flutter/material.dart';

// import "main.dart";
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      child: Row(
        // ListView.builder(
        //   itemCount: 4,
        //   itemBuilder: (BuildContext context, int index) {

        //   return ;
        //  },
        // ),
        children: <Widget>[
          _buildButton(context, "Diseases", ClickBody()),
          _buildButton(context, "Symptoms", SymptomsPage()),
          _buildButton(
            context,
            "Find Medical\n Centers",
            FindPlaces(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget widget) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      // onPressed: () {
      onPressed: () {
        // print("HI");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => SecondScreen()));
      // },
    );
  }

  // _launchURL(String text) async {
  //   String url = "https://www.google.com/maps/search/" +
  //       text +
  //       "/@6.8949906,79.917864,15.85z";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
