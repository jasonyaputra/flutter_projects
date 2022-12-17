// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'task_tile_widget.dart';
import 'task.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  final toDoList = Task.toDoList();
  List<Task> searchResults = [];

  @override
  void initState() {
    searchResults = toDoList;
    super.initState();
  }

  void search(String term) {
    List<Task> results = [];
    if (term.isEmpty) {
      results = toDoList;
    } else {
      results = toDoList
          .where(
              (item) => item.task!.toLowerCase().contains(term.toLowerCase()))
          .toList();
    }

    setState(() {
      searchResults = results;
    });
  }

  void toggleTask(Task todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteTask(String id) {
    setState(() {
      toDoList.removeWhere((item) => item.id == id);
    });
  }

  void addTask(String task) {
    setState(() {
      toDoList
          .add(Task(id: DateTime.now().millisecond.toString(), task: task));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 59, 57, 57),
        appBar: AppBar(
          title: Text("ToDo List"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 59, 57, 57),
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 2),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 102, 99, 99)),
                    child: TextField(
                      onChanged: (value) => search(value),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search,
                              color: Color.fromARGB(255, 59, 57, 57), size: 20),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear),
                            color: Color.fromARGB(255, 59, 57, 57),
                            iconSize: 20,
                          ),
                          hintText: "Search",
                          contentPadding: EdgeInsets.only(top: 14)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Text(
                            "Tasks:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        for (Task task in searchResults.reversed)
                          TaskTileWidget(
                            task: task,
                            taskToggle: toggleTask,
                            taskDelete: deleteTask,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 102, 99, 99),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 26, 24, 24),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Add new task", border: InputBorder.none),
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.only(right: 10, bottom: 21),
                    child: FloatingActionButton(
                      onPressed: () {
                        addTask(_controller.text);
                      },
                      backgroundColor: Colors.red,
                      elevation: 10,
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
