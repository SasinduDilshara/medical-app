import "package:flutter/material.dart";
import 'package:meditest/diseasecard.dart';
import 'DiseasesTopic.dart';
import "Search.dart";
import "home.dart";

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        title: Text("Symptoms"),
        backgroundColor: Colors.blue,
        
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar, color: Colors.white),
          //   onPressed: () {},
          // )
        ],
      ),
      
      body:
SingleChildScrollView(
child:
    Column(children: <Widget>[
      Search('Search Your Symptoms'),
      Card(
        child:
      Text("Select your symptoms to recognize your diease        "+"\n"+"        ",
                    style:TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue
      )
      )
      ),
      Card(child: 
      Row(children: <Widget>[
        Text("Sym1"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sym2"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sym3"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        Text("Sym4"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
      ],
      )
      ,
      ),

      Card(child: 
      Row(children: <Widget>[
        Text("Sym5"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sym6"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sym7"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        Text("Sym8"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
      ],
      )
      ,
      ),

      Card(child: 
      Row(children: <Widget>[
        Text("Sym9"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy10"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy11"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        Text("Sy12"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
      ],
      )
      ,
      ),

      Card(child: 
      Row(children: <Widget>[
        Text("Sy13"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy14"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy15"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        Text("Sy16"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
      ],
      )
      ,
      ),

      Card(
        // color:Colors.blue[200],
        child: 
      Row(children: <Widget>[
        Text("Sy17"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy18"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
        Text("Sy19"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        Text("Sy20"),
        
          Checkbox(
          // Text("sym1"),
          value: false,
          
        ),
        
      ],
      )
      ,
      ),

      Card(child: Row(children: <Widget>[

      ],),),

    Card(
      child: Row(children: <Widget>[
       
          FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      // onPressed: () {
        onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()),);
      },
          ),

 Text("                                                  "),
          FlatButton(
      child: Text(
        "Done",
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      // onPressed: () {
        onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DiseasesTopic("Dengue")),);
      },
          ),


      ],
      ),
    )

    ],
    ),
),


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

    );
  }
}