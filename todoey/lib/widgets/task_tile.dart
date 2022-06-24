import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  TaskTile({required this.isChecked, required this.taskTile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Tasks',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        // onChanged: toggleCheckBoxState,
        activeColor: Colors.lightBlueAccent, onChanged: (bool? value) {},
      ),
    );
  }
}
//
// (bool? checkBoxState) {
// setState(() {
// isChecked = checkBoxState!;
// });
