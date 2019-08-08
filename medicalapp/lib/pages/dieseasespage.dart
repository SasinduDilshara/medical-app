import 'package:flutter/material.dart';
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

          // articleList(),
          // articleList(),
        ],
      ),
    );
  }

  articleList() {
    crudObj.getData().then((results) {
      articles = results;
    });
    setState(() {
      crudObj.getData().then((results) {
        articles = results;
      });
    });
    if (articles != null) {
      debugPrint("a" * 100);
      return StreamBuilder(
        stream: articles,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DieseaseCard(
                      snapshot.data.documents[i]['title'],
                      snapshot.data.documents[i]['author'],
                      snapshot.data.documents[i]['description'],
                      ''),
                );
              },
            ),
          );
        },
      );
    } else {
      Text("loading");
    }
  }
}
