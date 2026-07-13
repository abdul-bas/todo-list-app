import 'package:flutter/material.dart';
import 'package:to_do_list_app/screens/ui/delete_task/delete_task.dart';

class TaskController {
  static void showBottomDialog(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return child;
      },
    );
  }

  static String? titleValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a task title';
    }

    if (value.trim().length < 3) {
      return 'Title must be at least 3 characters';
    }

    return null;
  }

  static String? descriptionValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a description';
    }

    if (value.trim().length < 5) {
      return 'Description must be at least 5 characters';
    }

    return null;
  }

  static String? dueDateValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a due date';
    }

    return null;
  }

  static Future<void> showDeleteTaskDialog(
    BuildContext context, {
    required String taskId,
    required String taskTitle,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (dialogContext) {
        return DeleteTask(
          taskId: taskId,
          taskTitle: taskTitle,
          dialogContext: dialogContext,
        );
      },
    );
  }
}
