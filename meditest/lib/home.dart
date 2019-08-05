import "package:flutter/material.dart";

import 'Body.dart';
import 'myCustomForm.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          // materialTapTargetSize: ,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new AddArticleForm()));
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 40, color: Colors.yellow),
          )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
      ),

      drawer: Drawer(
        // Row(CustomScrollView(
        //   slivers: <Widget>[

        //   ],
        // ),)

        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgwQACC-0sYwakNsNRm5xnPvBVcfhKlyp9Gmqaat86qoNM5IbM6Q",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Customer Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    bottom: 0,
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("My Profile"),
              leading: Icon(Icons.account_box),
              subtitle: Text(""),
              onTap: () {},
            ),
            ListTile(
              title: Text("My Reports"),
              leading: Icon(Icons.account_box),
              subtitle: Text(""),
              onTap: () {},
            ),
            ListTile(
              title: Text("Saved Reports"),
              leading: Icon(Icons.account_box),
              subtitle: Text(""),
              onTap: () {},
            ),
          ],
        ),
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

      body: Body(),

      // body: HomepageContent(),
    );
  }

  // void handlePressed1(int i) {
  //   print(i);
  // }

  // void handlePressed() {
  //   print("hello");
  // }
}
