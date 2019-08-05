import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'statefull demo',
      home: FavouriteCity(),
    );
  }
}

class FavouriteCity extends StatefulWidget {
  @override
  _FavouriteCityState createState() => _FavouriteCityState();
}

class _FavouriteCityState extends State<FavouriteCity> {
  String name = '';
  var currencies = ['Rupees', "Dollars", "Rubel", "Other"];
  String selected = "Rupees";
  @override
  Widget build(BuildContext context) {
    // debugPrint("1111111111111111111111111111111111111111111111111111111111111");
    return Scaffold(
        appBar: AppBar(
          title: Text("StateFullDemo"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                value: selected,
                onChanged: (String selected) {
                  setState(() => this.selected = selected);
                },
                items: currencies.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  },
                ).toList(),
              ),
              TextField(
                onSubmitted: (String input) {
                  setState(() {
                    // debugPrint("2222222222222222222222222222222222222222222");
                    this.name = input;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Your input name is " + this.name,
                      style: TextStyle(
                        fontSize: 20.0,
                      ))),
            ],
          ),
        ));
  }
}
