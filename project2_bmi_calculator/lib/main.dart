// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'resultpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmiCalculator(),
    );
  }
}

class bmiCalculator extends StatefulWidget {
  const bmiCalculator({super.key});

  @override
  State<bmiCalculator> createState() => _bmiCalculatorState();
}

class _bmiCalculatorState extends State<bmiCalculator> {
  String gender = 'm';
  late String result;
  late double height;
  late double weight;
  late int age;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        height: 80,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              gender = 'm';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: (gender == 'm')
                                  ? Colors.blue
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          icon: Icon(
                            Icons.male,
                            color: (gender == 'f') ? Colors.blue : Colors.white,
                          ),
                          label: Text(
                            "Man",
                            style: TextStyle(
                                color: (gender == 'm')
                                    ? Colors.white
                                    : Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        height: 80,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              gender = 'f';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: (gender == 'f')
                                  ? Colors.pink
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          icon: Icon(
                            Icons.female,
                            color: (gender == 'f') ? Colors.white : Colors.pink,
                          ),
                          label: Text(
                            "Woman",
                            style: TextStyle(
                                color: (gender == 'f')
                                    ? Colors.white
                                    : Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your height in cm:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Your height in cm",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your weight in kg:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Your weight in kg",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your age:",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Your age",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                        age = int.parse(ageController.value.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => resultpage(
                              getBmi(),
                              getBodyWeight(),
                              getComment(),
                            ),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white),
                    child: Text(
                      "Calculate",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String getBmi() {
    double bmi = weight / (height * height / 10000);
    result = bmi.toStringAsFixed(2);
    return result;
  }

  String getBodyWeight() {
    if (double.parse(result) >= 25) {
      return 'Overweight';
    } else if (double.parse(result) > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getComment() {
    if (double.parse(result) >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.\n 💪🏃🏋️🚴🏊';
    } else if (double.parse(result) >= 18.5) {
      return 'You have a normal body weight. Good job!\n 🍎🍌🥦🥕🍚';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.\n 🍕🍔🍟🌭🍗🥩';
    }
  }
}
