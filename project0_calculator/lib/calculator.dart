// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButtons(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(buttonText);
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(70, 70),
          shape: CircleBorder(),
          backgroundColor: buttonColor),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 25, color: textColor),
      ),
    );
  }

  int num1 = 0;
  String output = "";
  String operator = "";

  void calculate(String input) {
    setState(() {
      if (input == "C") {
        output = "";
      } else if (input == "+" || input == "-" || input == "x" || input == "/") {
        if (output[output.length - 1] == "+" ||
            output[output.length - 1] == "-" ||
            output[output.length - 1] == "*" ||
            output[output.length - 1] == "/") {}
        else {
          output = output + input;
        }
      } else if (input == "=") {
        output = output.replaceAll('x', '*');
        output = output.interpret().toString();
      } else {
        output = output + input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    output,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButtons("C", Colors.grey, Colors.red),
                numButtons("( )", Colors.grey, Colors.black),
                numButtons("%", Colors.grey, Colors.black),
                numButtons("/", Colors.orange, Colors.white)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButtons("7", Colors.grey[850]!, Colors.white),
                numButtons("8", Colors.grey[850]!, Colors.white),
                numButtons("9", Colors.grey[850]!, Colors.white),
                numButtons("x", Colors.orange, Colors.white)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButtons("4", Colors.grey[850]!, Colors.white),
                numButtons("5", Colors.grey[850]!, Colors.white),
                numButtons("6", Colors.grey[850]!, Colors.white),
                numButtons("-", Colors.orange, Colors.white)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButtons("1", Colors.grey[850]!, Colors.white),
                numButtons("2", Colors.grey[850]!, Colors.white),
                numButtons("3", Colors.grey[850]!, Colors.white),
                numButtons("+", Colors.orange, Colors.white)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButtons("+/-", Colors.grey[850]!, Colors.white),
                numButtons("0", Colors.grey[850]!, Colors.white),
                numButtons(".", Colors.grey[850]!, Colors.white),
                numButtons("=", Colors.orange, Colors.white)
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
