import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/enum/snack_bar.dart';
import 'package:to_do_list_app/core/utils/snack_bar/snack_bar.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/state/create_provider.dart';

class EditProvider extends CreateProvider {
  late TaskModel _task;

  void onInit(TaskModel task) {
    _task = task;

    titleController.text = task.title;
    descriptionController.text = task.description;
    dueDateController.text = task.dueDate;
  
  }

  Future<void> onEdit(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading = true;
      notifyListeners();

      final updatedTask = _task.copyWith(
        title: titleController.text,
        description: descriptionController.text,
        dueDate: dueDateController.text,
        isCompleted: _task.isCompleted,
      );

      final result = await repository.updateTask(updatedTask);
      if (!context.mounted) return;
      SnackBarHelper.show(context, message: result, type: SnackBarType.success);
    } catch (e) {
      SnackBarHelper.show(
        context,
        message: e.toString(),
        type: SnackBarType.error,
      );
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
