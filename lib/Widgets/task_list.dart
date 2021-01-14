import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Widgets/task_tile.dart';

import '../main.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListListener>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
                name: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                longPressCallback: () {
                  taskData.deleteTask(index);
                },
                toggleCheckboxState: (checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                });
          },
        );
      },
    );
  }
}
