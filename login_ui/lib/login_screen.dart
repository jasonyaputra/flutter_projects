// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login UI")),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
                child: Image.asset(
                  "images/login.png",
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Login"),
                )
              )
            ],
          )
        )
    );
  }
}
