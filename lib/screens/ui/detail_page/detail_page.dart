import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/screens/widgets/detail_page/body.dart';


class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: DetailsBody(task: task),
    );
  }
}
