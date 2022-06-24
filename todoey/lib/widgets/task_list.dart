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
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          taskTile: tasks[index].name,
          checkboxCallback: (checkBoxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
