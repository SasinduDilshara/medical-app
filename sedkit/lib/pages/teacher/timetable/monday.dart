import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyApp extends StatefulWidget {
 @override
 _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
 FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

 @override
 initState() {
   super.initState();
   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
   var initializationSettingsAndroid =
       new AndroidInitializationSettings('app_icon');
   var initializationSettingsIOS = new IOSInitializationSettings();
   var initializationSettings = new InitializationSettings(
       initializationSettingsAndroid, initializationSettingsIOS);
   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
   flutterLocalNotificationsPlugin.initialize(initializationSettings,
   onSelectNotification: onSelectNotification);
 }

 @override
 Widget build(BuildContext context) {
   return  new Scaffold(
       body: new Center(
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
           
             new RaisedButton(
               onPressed: _showNotificationWithDefaultSound,
               child: new Text('Show Notification With Default Sound'),
             ),
           ],
         ),
       ),
   );
 }

 Future onSelectNotification(String payload) async {
   showDialog(
     context: context,
     builder: (_) {
       return new AlertDialog(
         title: Text("PayLoad"),
         content: Text("Payload : $payload"),
       );
     },
   );
 }

 
// Method 2
Future _showNotificationWithDefaultSound() async {
 var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
     'your channel id', 'your channel name', 'your channel description',
     importance: Importance.Max, priority: Priority.High);
 var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
 var platformChannelSpecifics = new NotificationDetails(
     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
 await flutterLocalNotificationsPlugin.show(
   0,
   'Timetable reminder',
   'S',
   platformChannelSpecifics,
   payload: 'Default_Sound',
 );
}

}