import 'package:flutter/material.dart';
import "diseasecard.dart";
import "DiseasesTopic.dart";
import "SymptomsPage.dart";
import "home.dart";
// import "package:url_launcher/url_launcher.dart";
// import "Search.dart";
import "ClickBody.dart";

class Body extends StatelessWidget {
  // const Body(this.state)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        // title: Text("Medi Advisor"),
        //       bottomNavigationBar: BottomNavigationBar(
        //         backgroundColor: Colors.lightBlue,
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         title: Text('Home'),

        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.business),
        //         title: Text('Business'),
        //       ),

        //     ],

        //     selectedItemColor: Colors.amber[800],

        // ),

// bottomNavigationBar:BottomNavigationBar(
//         // currentIndex: _cIndex,
//         backgroundColor: Colors.blue,
//         type: BottomNavigationBarType.fixed ,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home,color: Color.fromARGB(255, 0, 0, 0)),
//             title: new Text('Home')
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.power,color: Colors.blue),
//             title: new Text('Power')
//           )
//         ],
//         onTap:(index) {
//           // print("HI");
//         Navigator.push(

//             context, MaterialPageRoute(builder: (context) => Home()),);

//       },
//       ),

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
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ...sdasdsd...........hgjghggvnvvnvv"),
                Diseasescard(2, "Caugh", "Sasindu",
                    "This is a disease about ....sdasda...........hgjghggvnvvnvv"),
                Diseasescard(3, "Dengue", "Sasindu",
                    "This is a diseabvmx.............hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),
                Diseasescard(1, "Dengue", "Sasindu",
                    "This is a disease about ..........................hgjghggvnvvnvv"),

                // ],)
              ],
            ),
          ],
        ))
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
          FlatButton(
            child: Text(
              "Find Your Doctor",
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            // onPressed: () {
            onPressed: () {
              // onPressed: _launchURL,
            },
            // Navigator.push(
            // context, MaterialPageRoute(builder: (context) => SecondScreen()));
            // },
          ),
          // _buildButton(context, "Another"),
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
}

/*
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column
      (children: <Widget>[
        Buttons(),
      ],),
      // color: Colors.orange,
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        // ListView.builder(
        //   itemCount: 4,
        //   itemBuilder: (BuildContext context, int index) {


            
        //   return ;
        //  },
        // ),
                  children: <Widget>[
                    _buildButton(context, "Type"),
                    _buildButton(context, "Symtoms"),
                    _buildButton(context, "FirstAid"),
                    _buildButton(context, "Another"),
                  ],
                ),
    );
  }


Widget _buildButton(BuildContext context, String text) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      onPressed: () {
        // Navigator.push(
            // context, MaterialPageRoute(builder: (context) => SecondScreen()));
      },
    );
  }
}
*/
