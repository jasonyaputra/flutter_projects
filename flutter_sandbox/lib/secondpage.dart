// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = "secondpage";

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("2nd Page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  num = num + 1;
                });
              },
              child: Text("Add List Tile")
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  num = num - 1;
                });
              },
              child: Text("Delete List Tile")
            ),
            ListView.builder(
              physics: ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return Container(
                  color: index.isEven ? Colors.orangeAccent : Colors.lightBlueAccent,
                  child: ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text("Tile title"),
                    subtitle: Text("Subtitle"),
                    trailing: Icon(Icons.developer_board),
                  ),
                );
              },
              itemCount: num,
            ),
          ],
        ),
      )
    );
  }
}
