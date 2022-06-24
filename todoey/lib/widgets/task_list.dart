import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/model/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  List<Task> tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Eggs"),
    Task(name: "Buy Bread")
  ];

  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(
          taskTile: tasks[0].name,
          isChecked: tasks[0].isDone,
        ),
        TaskTile(
          taskTile: tasks[1].name,
          isChecked: tasks[1].isDone,
        ),
        TaskTile(
          taskTile: tasks[2].name,
          isChecked: tasks[2].isDone,
        ),
      ],
    );
  }
}
