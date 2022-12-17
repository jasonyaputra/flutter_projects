// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter Coding Exercise"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: num == 0 ? MainAxisAlignment.start : num == 1 ? MainAxisAlignment.center : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: num == 0 ? MainAxisAlignment.start : num == 1 ? MainAxisAlignment.center : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num == 2 ? num = 0 : num++;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: getColor(Colors.red, Colors.white),
                      backgroundColor: getColor(Colors.white, Colors.red),
                      side: getBorder(Colors.red, Colors.black54),
                    ),
                    child: Text("Press"),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.home), color: Colors.white)
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
    getBorder(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: colorPressed, width: 2);
      } else {
        return BorderSide(color: color, width: 2);
      }
    }

    return MaterialStateProperty.resolveWith(getBorder);
  }
}