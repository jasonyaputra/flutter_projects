// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  static const routeName = "thirdpage";

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController _controller = TextEditingController();
  String title = "Title";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3rd Page"),
      ),
      body: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Set title here",
              ),
            ),
          ),
          Center(
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    title = _controller.text;
                  });
                },
                child: Text("Set title")),
          )
        ],
      ),
    );
  }
}
