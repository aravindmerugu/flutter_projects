import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkBoxCallBack: (bool? checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallBack: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}