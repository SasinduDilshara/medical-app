import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        /* margin is distance between 2 widgets*/
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.red,
            // height: 100,
            // width: 200,
            // margin: EdgeInsets.only(right: 15.0, top: 50.0),
            // padding: EdgeInsets.only(right: 15.0, top: 50.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Hello  I am sasindu?",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        // fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle.italic
                      ),
                    )),
                    Expanded(
                      child: Text(
                        "Hello  I am sasindu?",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontSize: 30
                            // fontFamily: 'Raleway',
                            // fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle.italic
                            ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Hello  I am sasindu?",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        // fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle.italic
                      ),
                    )),
                    Expanded(
                      child: Text(
                        "Hello  I am sasindu?",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontSize: 30
                            // fontFamily: 'Raleway',
                            // fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle.italic
                            ),
                      ),
                    )
                  ],
                ),
                ImageAsset(),
                BookingButton(),
              ],
            )));
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage aim = AssetImage("images/Final.png");
    Image im = Image(
      image: aim,
      width: 250.0,
      height: 100.0,
    );
    return Container(
      child: im,
    );
  }
}

class BookingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 250.0,
        margin: EdgeInsets.only(top: 30.0),
        child: RaisedButton(
          child: Text(
            "Book Your Flight",
            style: TextStyle(fontSize: 25),
          ),
          elevation: 6.0,
          onPressed: () => bookFlight(context),
          color: Colors.blueAccent,
        ));
  }

  void bookFlight(BuildContext context) {
    var alertdialog = AlertDialog(
      backgroundColor: Colors.pink,
      title: Text("Flight Book sucessfully"),
      content: Text("Have a plesant flight, Thankyou!"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertdialog);
  }
}
