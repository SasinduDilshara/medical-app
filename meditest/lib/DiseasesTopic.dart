import 'package:flutter/material.dart';
import 'package:meditest/diseasecard.dart';

class DiseasesTopic extends StatelessWidget {
  final String disease;

  const DiseasesTopic(
    this.disease,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text(this.disease),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Buttons(),
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
        ));
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      child: Row(
        children: <Widget>[
          _buildButtons(context, "Western", DiseasesTopic("Dengue")),
          _buildButtons(context, "Ayurweda", DiseasesTopic("Dengue")),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, String text, Widget widget) {
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
