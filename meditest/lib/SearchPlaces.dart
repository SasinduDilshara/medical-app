import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class SearchPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue[50],
        child: Column(
          children: <Widget>[
            Text(
              "What do you want to search in your area ?",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: FlatButton(
                child: Text(
                  "Pharmacies                                                                                                                                                                                      ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  _launchURL('Pharmacy');
                },
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: FlatButton(
                child: Text(
                  "Dispanceries                                                                                                                                                                                    ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  _launchURL('Dispensary');
                },
              ),
            ),
          ],
        ));
  }

  _launchURL(String text) async {
    String url = 'https://www.google.com/maps/search/' +
        text +
        '/@7.1028535,79.9932313,13z';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
