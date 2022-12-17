// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, camel_case_types, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {

  resultpage(this.bmi, this.result, this.comment);

  String bmi;
  String result;
  String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 121, 118, 118),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Result:',
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      result,
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: (result == "Normal") ? Color.fromARGB(255, 34, 206, 0) : (result == "Underweight") ? Color.fromARGB(255, 231, 228, 9) : Colors.red
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      bmi,
                        style: TextStyle(
                        fontSize: 50
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      comment,
                        style: TextStyle(
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                child: Text(
                  "Recalculate"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
