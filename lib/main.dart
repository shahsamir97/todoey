import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/task_screen.dart';

import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListListener>(
      create: (context) => TaskListListener(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

class TaskListListener extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Say Fajr prayer", isDone: false),
  ];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
