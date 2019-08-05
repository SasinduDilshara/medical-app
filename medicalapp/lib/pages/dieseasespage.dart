import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicalapp/componentwidgets/dieseasecard.dart';
import 'package:medicalapp/componentwidgets/searchbar.dart';

import 'addarticlepage.dart';

class DieseasePage extends StatefulWidget {
  @override
  _DieseasePageState createState() => _DieseasePageState();
}

class _DieseasePageState extends State<DieseasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddForm();
          }));
        },
        tooltip: "Click here to add a article",
      ),
      appBar: AppBar(
        title: Text("Dieseases"),
      ),
      body: Column(
        children: <Widget>[
          Search("Enter Your Dieseases"),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                ),
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {},
                  textColor: Colors.blue,
                ),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text("Search"),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          DieseaseCard(
              'Dengue',
              "Sasindu",
              "Recent cases of Dengue have been reported from Sri Lanka. The most affected areas include Colombo, Galle, Jaffna, and Gampaha. Risk of Dengue exists throughout the country and transmission occurs year-round. There are two peak seasons for Dengue transmission in Sri Lanka: from October to December and from May to July.",
              "2019/07/02"),

          // getListView(),
        ],
      ),
    );
  }

  // ListView getListView() {
  //   ListView getNoteListView() {
  //     TextStyle titleStyle = Theme.of(context).textTheme.subhead;

  //     return ListView.builder(
  //       itemCount: count,
  //       itemBuilder: (BuildContext context, int position) {
  //         return Card(
  //           color: Colors.white,
  //           elevation: 2.0,
  //           child: ListTile(
  //             // leading: CircleAvatar(
  //             //   backgroundColor:
  //             //       getPriorityColor(this.noteList[position].priority),
  //             //   child: getPriorityIcon(this.noteList[position].priority),
  //             // ),
  //             title: Text(
  //               // this.noteList[position].title,
  //               style: titleStyle,
  //             ),
  //             // subtitle: Text(this.noteList[position].date),
  //             trailing: GestureDetector(
  //               child: Icon(
  //                 Icons.delete,
  //                 color: Colors.grey,
  //               ),
  //               onTap: () {
  //                 // _delete(context, noteList[position]);
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   }
  // }
}
