import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "DiseasesTopic.dart";
import "SymptomsPage.dart";
import "Search.dart";
import "Body.dart";
import "home.dart";
import "diseasecard.dart";

class ClickBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Container()));
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 40, color: Colors.yellow),
          )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
      ),
      appBar: AppBar(
        title: Text("Medi Advisor"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar,
                color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Buttons(),
              Card(
                child: Search('Search Your diease here'),
              ),
              Buttons1(),
              Container(
                color: Colors.green[100],
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        for (var letter in [
                          "A",
                          "B",
                          "C",
                          "D",
                          "E",
                          "F",
                          "G",
                          "H",
                          "I",
                          "J",
                          "K",
                          "L",
                          "M",
                          "N",
                          "O",
                          "P",
                          "Q",
                          "R",
                          "S",
                          "T",
                          "U",
                          "V",
                          "W",
                          "X",
                          "Y",
                          "Z"
                        ])
                          Row(
                            children: <Widget>[
                              Text(letter + "           -           ",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              Column(
                                children: <Widget>[
                                  Text(
                                      "Disease 1\nDisease 2\nDisease 3\nDisease 4\n",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ],
                              )
                            ],
                          )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 170.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                    Diseasescard(1, "Dengue", "Sasindu",
                        "Dengue fever is a mosquito-borne tropical disease caused by the dengue virus"),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class Buttons1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      child: Row(
        children: <Widget>[
          Text("                                             "),
          _buildButton(context, "Cancel", Home()),
          _buildButton(context, "Search", DiseasesTopic("Dengue")),
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    );
  }
}
