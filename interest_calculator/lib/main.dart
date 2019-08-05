import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      title: "Interest Calculator",
      home: SIForm(),
    );
  }
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formkey = GlobalKey<FormState>();
  var currencies = ["Rupees", "Dollar", "Rubel"];
  var selected = '';
  void initState() {
    super.initState();
    selected = currencies[0];
  }

  String ans = '';
  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textstyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("SI Calculator"),
        // backgroundColor: Colors.purpleAccent,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            getImage(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: principleController,
                validator: (String input) {
                  if (input.isEmpty) {
                    return "Plese enter principle";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.yellow),
                  labelStyle: textstyle,
                  labelText: "Principle",
                  hintText: "Enter Principle e:g 12000",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (String input) {
                  if (input.isEmpty) {
                    return "Plese enter Precentage";
                  }
                },
                controller: roiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Rate of interset",
                    hintText: "In a precentage",
                    labelStyle: textstyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    fillColor: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "Plese enter Precentage";
                      }
                    },
                    controller: termController,
                    decoration: InputDecoration(
                        labelText: "Term",
                        hintText: "Time in Years",
                        labelStyle: textstyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        fillColor: Colors.black),
                  ),
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  items: currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: selected,
                  onChanged: (String newselected) {
                    setState(() {
                      selected = newselected;
                    });
                  },
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          "Calculate",
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState.validate()) {
                              this.ans = returncalculatedvalue();
                            }
                          });
                        }),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Reset",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          reset();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.ans, textScaleFactor: 1.5, style: textstyle),
            ),
          ],
        ),
      ),
    );
  }

  String returncalculatedvalue() {
    double principle = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalpay = principle * (1 + roi * term / 100);
    return "After $term years, Your invesment is $totalpay.";
  }

  void reset() {
    principleController.text = '';
    roiController.text = '';
    termController.text = '';
    this.ans = '';
    this.selected = currencies[0];
  }

  Widget getImage() {
    AssetImage asim = AssetImage("images/Final.png");
    Image im = Image(
      image: asim,
      width: 125.0,
      height: 125.0,
    );
    return Container(
        // color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: im,
        ));
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.indigo,
//         accentColor: Colors.indigoAccent,
//       ),
//       debugShowCheckedModeBanner: false,
//       title: "Interest Calculator",
//       home: SIForm(),
//     );
//   }
// }

// class SIForm extends StatefulWidget {
//   @override
//   _SIFormState createState() => _SIFormState();
// }

// class _SIFormState extends State<SIForm> {
//   var currencies = ["Rupees", "Dollar", "Rubel"];
//   var selected = '';
//   void initState() {
//     super.initState();
//     selected = currencies[0];
//   }

//   String ans = '';
//   TextEditingController principleController = TextEditingController();
//   TextEditingController roiController = TextEditingController();
//   TextEditingController termController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     TextStyle textstyle = Theme.of(context).textTheme.title;
//     return Scaffold(
//       // resizeToAvoidBottomPadding: false,
//       // backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text("SI Calculator"),
//         // backgroundColor: Colors.purpleAccent,
//       ),
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             getImage(),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: TextField(
//                 controller: principleController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelStyle: textstyle,
//                   labelText: "Principle",
//                   hintText: "Enter Principle e:g 12000",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: TextField(
//                 controller: roiController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     labelText: "Rate of interset",
//                     hintText: "In a precentage",
//                     labelStyle: textstyle,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0)),
//                     fillColor: Colors.black),
//               ),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     keyboardType: TextInputType.number,
//                     controller: termController,
//                     decoration: InputDecoration(
//                         labelText: "Term",
//                         hintText: "Time in Years",
//                         labelStyle: textstyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)),
//                         fillColor: Colors.black),
//                   ),
//                 ),
//                 Container(
//                   width: 10.0,
//                 ),
//                 Expanded(
//                     child: DropdownButton<String>(
//                   items: currencies.map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   value: selected,
//                   onChanged: (String newselected) {
//                     setState(() {
//                       selected = newselected;
//                     });
//                   },
//                 ))
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: RaisedButton(
//                         color: Theme.of(context).accentColor,
//                         textColor: Theme.of(context).primaryColor,
//                         child: Text(
//                           "Calculate",
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             this.ans = returncalculatedvalue();
//                           });
//                         }),
//                   ),
//                   Expanded(
//                     child: RaisedButton(
//                       color: Theme.of(context).primaryColor,
//                       textColor: Theme.of(context).primaryColorLight,
//                       child: Text(
//                         "Reset",
//                         textScaleFactor: 1.5,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           reset();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(this.ans, textScaleFactor: 1.5, style: textstyle),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String returncalculatedvalue() {
//     double principle = double.parse(principleController.text);
//     double roi = double.parse(roiController.text);
//     double term = double.parse(termController.text);

//     double totalpay = principle * (1 + roi * term / 100);
//     return "After $term years, Your invesment is $totalpay.";
//   }

//   void reset() {
//     principleController.text = '';
//     roiController.text = '';
//     termController.text = '';
//     this.ans = '';
//     this.selected = currencies[0];
//   }

//   Widget getImage() {
//     AssetImage asim = AssetImage("images/Final.png");
//     Image im = Image(
//       image: asim,
//       width: 125.0,
//       height: 125.0,
//     );
//     return Container(
//         // color: Colors.white,
//         padding: EdgeInsets.all(20.0),
//         child: Center(
//           child: im,
//         ));
//   }
// }
