import 'package:flutter/material.dart';

class FullDescriptionCard extends StatefulWidget {
  String _name, _author, _description, _link, date;
  FullDescriptionCard(this._name, this._author, this._description, this.date);
  @override
  @override
  _FullDescriptionCardState createState() => _FullDescriptionCardState();
}

class _FullDescriptionCardState extends State<FullDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.yellow,
        // width: 350,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                getImage("images/doctors.jpg"),
                Container(
                  width: 1.0,
                ),
                Expanded(
                  child: Container(
                    height: 51.0,
                    color: Colors.yellow[600],
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            widget._name,
                            style: TextStyle(
                                fontSize: 30, color: Colors.grey[900]),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Row(children: <Widget>[
                            Container(
                                child: Text(
                              "By:- ",
                              style: TextStyle(color: Colors.grey[900]),
                            )),
                            Text(
                              widget._author + "    " + widget.date,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                widget._description,
                // textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(String link) {
    AssetImage asim = AssetImage(link);

    Image im = Image(
      image: asim,
      width: 50.0,
      height: 50.0,
      fit: BoxFit.cover,
    );

    return Container(
      width: 50.0,
      height: 50.0,
      child: im,
    );
  }
}
