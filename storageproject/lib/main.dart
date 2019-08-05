import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  File sampleImage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File sampleImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null ? Text("Plz Upload") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
      ),
    );
  }

  Widget enableUpload() {
    return Container(
        child: Column(
      children: <Widget>[
        Image.file(sampleImage, height: 300.0, width: 300.0),
        RaisedButton(
          elevation: 7.0,
          child: Text("UPLOAD"),
          color: Colors.blue,
          onPressed: () async {
            final StorageReference firref =
                FirebaseStorage.instance.ref().child('firstimage.jpg');
            final StorageUploadTask task = firref.putFile(sampleImage);
          },
        )
      ],
    ));
  }

  Future getImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempimage;
    });
  }
}
