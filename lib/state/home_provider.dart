import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/enum/snack_bar.dart';
import 'package:to_do_list_app/core/utils/snack_bar/snack_bar.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/repository/task_repository.dart';

class HomeProvider extends ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepository();

  bool isLoading = false;
  List<TaskModel> tasks = [];
  List<TaskModel> filterTask = [];

  Future<void> fetchTask() async {
    final data = await _taskRepository.getData();

    tasks = data.docs.map((doc) => TaskModel.fromMap(doc.data())).toList();
    filterTask = tasks;
    notifyListeners();
  }

  int get completedTaskCount => tasks.where((task) => task.isCompleted).length;

  int get pendingTaskCount => tasks.where((task) => !task.isCompleted).length;

  void filter(String query) {
    if (query.trim().isEmpty) {
      filterTask = List.from(tasks);
    } else {
      filterTask = tasks.where((task) {
        return task.title.toLowerCase().contains(query.toLowerCase()) ||
            task.description.toLowerCase().contains(query.toLowerCase()) ||
            task.dueDate.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  Future<void> updateTaskStatus({
    required BuildContext context,
    required String id,
    required bool isCompleted,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await _taskRepository.updateTaskStatus(
        id: id,
        isCompleted: isCompleted,
      );

      if (!context.mounted) return;

      final success = result == 'Task status updated';

      if (!success) {
        SnackBarHelper.show(context, message: result, type: SnackBarType.error);
        return;
      }

      await fetchTask();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        SnackBarHelper.show(
          context,
          message: 'Something went wrong. Please try again.',
          type: SnackBarType.error,
        );
      }
    }
  }

  Future<void> deleteTask({
    required BuildContext context,
    required String id,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      if (!context.mounted) return;
      final result = await _taskRepository.deleteTask(id);

      final success = result == 'Task deleted successfully';

      if (!success) {
        if (!context.mounted) return;
        SnackBarHelper.show(context, message: result, type: SnackBarType.error);
        return;
      }

      await fetchTask();

      if (context.mounted) {
        SnackBarHelper.show(
          context,
          message: 'Task deleted',
          type: SnackBarType.success,
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackBarHelper.show(
          context,
          message: 'Something went wrong. Please try again.',
          type: SnackBarType.error,
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
