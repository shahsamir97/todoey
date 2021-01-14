import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';

import '../main.dart';

class AddTaskScreen extends StatelessWidget {
  String taskText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                taskText = value;
              },
              decoration: InputDecoration(
                  hintText: 'Write your task here...',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  focusColor: Colors.lightBlueAccent),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                if (taskText.isNotEmpty) {
                  Provider.of<TaskListListener>(context, listen: false)
                      .addTask(Task(name: taskText, isDone: false));
                  Navigator.pop(context);
                }
              },
              // tasks.add(Task(name: task, isDone: false));,
              minWidth: 150,
              child: Text('Add'),
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
