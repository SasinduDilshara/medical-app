import 'package:flutter/material.dart';
import "diseasecard.dart";
import "DiseasesTopic.dart";
import "SymptomsPage.dart";
class SearchDieseases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
        // title: Text("Medi Advisor"),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        
      ],
    
      selectedItemColor: Colors.amber[800],
      
    
  ),
      

      backgroundColor: Colors.blue[200],
      body: 
      
      Stack(children: <Widget>[
        // Image.network(
                
        //         // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbEGFBG4Lj117ZRBMgTiPGvrmNOnusllg__ZvclNiB3l37bI19iQ",
        //         fit: BoxFit.cover,
        //       ),
     Column
      (
        children: <Widget>[
          // Checkbox(
          //   value: false,
          //   // onChanged: (),
          //   // onChanged: (){},
          // ),
      // TextBox.fromLTRBD(2, top, right, bottom, direction),
        
        // for (var item in [1,2,3]) 
          Diseasescard(1,"Dengue","Sasindu",
          "This is a disease about ...sdasdsd...........hgjghggvnvvnvv"),
          Diseasescard(2,"Caugh","Sasindu",
          "This is a disease about ....sdasda...........hgjghggvnvvnvv"),
          Diseasescard(3,"Dengue","Sasindu",
          "This is a diseabvmx.............hgjghggvnvvnvv"),
          //Diseasescard(1,"Dengue","Sasindu",
          //"This is a disease about ..........................hgjghggvnvvnvv"),
          
      
      ],
      ),
      ],)
      
      // ],)
      
        
      // color: Colors.orange,
    );
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
                    _buildButton(context, "Diseases",DiseasesTopic('Dengue')),
                    _buildButton(context, "Symptoms",SymptomsPage()),
                    _buildButton(context, "Find Your Doctor.",Container()),
                    // _buildButton(context, "Another"),
                  ],
                ),
    );
  }


Widget _buildButton(BuildContext context, String text , Widget widget) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      // onPressed: () {
        onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget),);
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