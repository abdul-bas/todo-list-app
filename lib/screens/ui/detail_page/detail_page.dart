import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/screens/widgets/detail_page/detail_card.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailCard(title: 'Title', value: task.title, icon: Icons.title),
            const SizedBox(height: 10),

            DetailCard(
              title: 'Description',
              value: task.description,
              icon: Icons.description,
            ),
            const SizedBox(height: 10),

            DetailCard(
              title: 'Due Date',
              value: task.dueDate,
              icon: Icons.calendar_today,
            ),
            const SizedBox(height: 10),

            DetailCard(
              title: 'Status',
              value: task.isCompleted ? 'Completed' : 'Pending',
              icon: task.isCompleted ? Icons.check_circle : Icons.pending,
            ),
          ],
        ),
      ),
    );
  }
}
