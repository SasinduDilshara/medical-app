import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:medicalapp/componentwidgets/dieseasecard.dart';
import 'package:medicalapp/componentwidgets/searchbar.dart';
import 'package:medicalapp/servicers/crud/crud.dart';

import 'addarticlepage.dart';

class DieseasePage extends StatefulWidget {
  @override
  _DieseasePageState createState() => _DieseasePageState();
}

class _DieseasePageState extends State<DieseasePage> {
  initState() {
    super.initState();
    crudObj.getData().then((results) {
      articles = results;
    });
  }

  CrudMethod crudObj = CrudMethod();
  Stream articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {
          crudObj.getTreatmentText('regnum', context);
        },
        tooltip: "Click here to add a article",
      ),
      appBar: AppBar(
        title: Text("Dieseases"),
      ),
      body: ListView(
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

          // DieseaseCard(
          //     'Dengue',
          //     "Sasindu",
          //     "Recent cases of Dengue have been reported from Sri Lanka. The most affected areas include Colombo, Galle, Jaffna, and Gampaha. Risk of Dengue exists throughout the country and transmission occurs year-round. There are two peak seasons for Dengue transmission in Sri Lanka: from October to December and from May to July.",
          //     "2019/07/02"),

          // articleList(),

          articleList(),
        ],
      ),
    );
  }

  articleList() {
    // crudObj.getData().then((results) {
    //   articles = results;
    // });

    // crudObj.getData().then((results) {
    //   articles = results;
    //   // Future.delayed(duration:)
    // });

    setState(() {
      crudObj.getData().then((results) async {
        articles = results;
        // await Future.delayed(Duration(microseconds: 1000000));
      });
    });
    // int a = await articles.length;
    if (articles != null) {
      // debugPrint("b" * 100);
      return StreamBuilder(
        stream: articles,
        builder: (context, snapshot) {
          int length = snapshot.data.documents.length;
          // debugPrint("c" * 100);
          // debugPrint(snapshot.data.documents[1]['title'] + " " + "a" * 100000);
          // debugPrint(snapshot.data.documents.length.toString());
          return Column(
            children: <Widget>[
              createDiesecard(0, length, snapshot.data.documents),
              createDiesecard(1, length, snapshot.data.documents),
              createDiesecard(2, length, snapshot.data.documents),
              createDiesecard(3, length, snapshot.data.documents),
              createDiesecard(4, length, snapshot.data.documents),
              // DieseaseCard(
              //     var c = snapshot.data.documents[0],
              //     snapshot.data.documents[0]['author'],
              //     snapshot.data.documents[0]['description'],
              //     ''),
            ],
          );
        },
      );
    } else {
      return Center(
          child: Text(
        "loading",
        style: TextStyle(fontSize: 18),
      ));
    }
  }

  Widget createDiesecard(int num1, int bound, List data) {
    if (num1 < bound) {
      return DieseaseCard(data[num1]['title'], data[num1]['author'],
          data[num1]['description'], data[num1]['date']);
    } else {
      return Container();
    }
  }
}
