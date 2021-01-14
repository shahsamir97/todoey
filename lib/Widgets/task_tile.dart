import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool isChecked;
  final Function toggleCheckboxState;
  final Function longPressCallback;

  TaskTile(
      {this.name,
      this.isChecked,
      this.toggleCheckboxState,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        name,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckboxState,
        //onChanged: toggleCheckboxState,
      ),
    );
  }
}
