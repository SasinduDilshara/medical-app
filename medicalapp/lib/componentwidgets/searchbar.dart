import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final void Function(String) onTextChange;
  final String hint;
  TextEditingController tec = TextEditingController();

  Search(this.hint, {this.onTextChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.all(8),
        child: TextField(
            controller: tec,
            onChanged: onTextChange,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }
}
