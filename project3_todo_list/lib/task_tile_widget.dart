// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'task.dart';

class TaskTileWidget extends StatelessWidget {
  final Task task;
  final taskToggle;
  final taskDelete;

  const TaskTileWidget(
      {Key? key,
      required this.task,
      required this.taskToggle,
      required this.taskDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
          onTap: () {
            taskToggle(task);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Color.fromARGB(255, 102, 99, 99),
          leading: IconButton(
              onPressed: () {
                taskToggle(task);
              },
              icon: Icon(
                  task.isDone ? Icons.check_box : Icons.check_box_outline_blank),
              color: Colors.orange),
          title: Text(
            task.task!,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.delete),
            onPressed: () {
              taskDelete(task.id);
            },
          )),
    );
  }
}
