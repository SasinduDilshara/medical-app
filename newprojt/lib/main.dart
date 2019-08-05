import 'package:flutter/material.dart';

import 'app_screens/firstscreen.dart';
import 'app_screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.blue,
        title: "Testing App",
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: "Add one more Item",
              /* visible in long pressed */
              onPressed: () {
                // bookFlight(context);

                debugPrint("FLOAT BUTTON WORKED");
              },
            ),
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: Text("ListView"),
            ),
            body: getLongListViewer()));
  }

  void showSnackbar_(BuildContext context, int index) {
    var snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text("Item $index is clicked"),
      action: SnackBarAction(
        onPressed: () {},
        label: "Undo",
      ),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  List<String> getListElement() {
    var items =
        List<String>.generate(1000, (counter_) => "This is number $counter_");
    return items;
  }

  Widget getLongListViewer() {
    var getelements = getListElement();
    return (ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.phone),
        trailing: Icon(Icons.web),
        title: Text(getelements[index]),
        subtitle: Text("this is number $index"),
        onTap: () {
          // bookFlight(context);
          showSnackbar_(context,
              index); /*right now this is the contex of itembuilder, but framework auto correct it to the scaffold*/
        },
      );
    }));
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

  Widget getListView() {
    var listView = ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            debugPrint("Landscape Tapped");
          },
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("nice"),
          trailing: Icon(Icons.wb_sunny),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.phone),
          title: Text("Landscape"),
          subtitle: Text("nice"),
          trailing: Icon(Icons.wb_sunny),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("nice"),
          trailing: Icon(Icons.wb_sunny),
        ),
        Text("Anoother"),
        Container(color: Colors.red, height: 50)
      ],
    );

    return listView;
  }
}
