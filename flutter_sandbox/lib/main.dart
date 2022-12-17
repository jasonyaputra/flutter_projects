// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/thirdpage.dart';
import 'secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffoldApp(),
      routes: {
        SecondPage.routeName: (_) => SecondPage(),
        ThirdPage.routeName: (_) => ThirdPage()
      },
    );
  }
}

class MyScaffoldApp extends StatefulWidget {
  @override
  State<MyScaffoldApp> createState() => _MyScaffoldAppState();
}

class _MyScaffoldAppState extends State<MyScaffoldApp> {
  bool button = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Sandbox"),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              print("clicked");
            },
            icon: Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                print("Notification clicked");
              },
              icon: Icon(Icons.notifications, color: Colors.white54)),
          IconButton(
              onPressed: () {
                print("Search clicked");
              },
              icon: Icon(Icons.search, color: Colors.white54))
        ],
        elevation: 10,
        titleSpacing: 12,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          print("Floating clicked");
        },
        mini: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
        elevation: 10,
        highlightElevation: 20,
        child: Icon(Icons.add),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       print("Pressed");
      //     },
      //     icon: Icon(Icons.message, color: Colors.white,),
      //     label: Text("Message"),
      //     foregroundColor: Colors.orange,
      //     backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: button
                  ? Image.asset("images/marciguild.png")
                  : Image.asset("images/marci.jpg"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    button = !button;
                  });
                },
                child: Text("Press")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  "https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_.jpg"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SecondPage.routeName);
                },
                child: Text("Next Page"))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.orange,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Spacer(flex: 1),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ThirdPage.routeName);
                },
                icon: Icon(Icons.navigate_before),
              ),
              Spacer(), //flex: 1
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SecondPage.routeName);
                },
                icon: Icon(Icons.navigate_next),
              ),
              Spacer()
            ],
          )),
    );
  }
}
