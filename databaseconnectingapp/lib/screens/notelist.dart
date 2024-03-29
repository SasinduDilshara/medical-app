// import 'package:databaseconnectingapp/models/note.dart';
// import 'package:databaseconnectingapp/screens/note_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:databaseconnectingapp/utils/database_helper.dart';

// class NoteList extends StatefulWidget {
//   @override
//   _NoteListState createState() => _NoteListState();
// }

// class _NoteListState extends State<NoteList> {
//   DatabaseHelper databasehelper = DatabaseHelper();
//   List<Note> noteList;
//   int count = 0;
//   Color prioritycolor = Colors.yellow;

//   @override
//   Widget build(BuildContext context) {
//     if (noteList == null) {
//       noteList = List<Note>();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notes"),
//       ),
//       body: getListView(),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.purple,
//         tooltip: "Add a note",
//         child: Icon(Icons.add),
//         onPressed: () {
//           navigateToAnother(context, NoteDetail("Add a Note"));
//         },
//       ),
//     );
//   }

//   ListView getListView() {
//     TextStyle ts = Theme.of(context).textTheme.subhead;
//     return ListView.builder(
//         itemCount: count,
//         itemBuilder: (BuildContext context, int position) {
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Icon(Icons.keyboard_arrow_right),
//                 backgroundColor: prioritycolor,
//               ),
//               title: Text(
//                 "Dummy Title",
//                 style: ts,
//               ),
//               subtitle: Text(
//                 "Dummy Data",
//                 style: ts,
//               ),
//               trailing: Icon(
//                 Icons.delete,
//                 color: Colors.grey,
//               ),
//               onTap: () {
//                 navigateToAnother(context, NoteDetail("Edit Note"));
//               },
//               onLongPress: () {},
//             ),
//             color: Colors.white,
//             elevation: 2.0,
//           );
//         });
//   }

//   void navigateToAnother(BuildContext context, Widget next) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return next;
//     }));
//   }

//   Color getPriorityolor(int priority) {
//     if (priority == 1) return Colors.red;
//     if (priority == 2) return Colors.green;
//     if (priority == 3) return Colors.yellow;
//   }

//   Icon getPriorityIcon(int priority) {
//     if (priority == 1) return Icon(Icons.play_arrow);
//     if (priority == 2) return Icon(Icons.keyboard_arrow_left);
//     if (priority == 3) return Icon(Icons.keyboard_arrow_right);
//   }

//   void _delete(BuildContext context, Note note) async {
//     int result = await databasehelper.deleteNote(note.id);
//     if (result != 0) {
//       _showsnackbar(context, "Note Deleted Succesfully");
//       //update list
//     }
//   }

//   void _showsnackbar(BuildContext con, String messge) {
//     final snack = SnackBar(content: Text(messge));
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:databaseconnectingapp/models/note.dart';
import 'package:databaseconnectingapp/utils/database_helper.dart';
import 'package:databaseconnectingapp/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', '', 2), 'Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),
            title: Text(
              this.noteList[position].title,
              style: titleStyle,
            ),
            subtitle: Text(this.noteList[position].date),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position], 'Edit Note');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully', note);
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message, [Note note]) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
          textColor: Colors.blue,
          label: "Undo",
          onPressed: () {
            setState(() {
              _save(note);
              updateListView();
            });
          }),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      /*when navigator.pop activate it will recame to this screen */
      updateListView(); //??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void _save(Note note) async {
    int result;
    // Case 2: Insert Operation
    result = await databaseHelper.insertNote(note);
  }
}
