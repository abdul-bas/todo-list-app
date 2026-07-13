import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/core/enum/snack_bar.dart';
import 'package:to_do_list_app/core/utils/snack_bar/snack_bar.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/repository/task_repository.dart';
import 'package:to_do_list_app/state/home_provider.dart';

class CreateProvider extends ChangeNotifier {
  final TaskRepository repository = TaskRepository();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  bool isLoading = false;
  Future<void> onSubmit(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading = true;
      notifyListeners();
      final model = TaskModel(
        id: '',
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        dueDate: dueDateController.text.trim(),
        isCompleted: false,
      );

      final result = await repository.createTask(model);
      if (!context.mounted) return;

      final success = result == 'Task created successfully';

      SnackBarHelper.show(
        context,
        message: result,
        type: success ? SnackBarType.success : SnackBarType.error,
      );

      if (success) {
        await context.read<HomeProvider>().fetchTask();
        titleController.clear();
        descriptionController.clear();
        dueDateController.clear();
        if (!context.mounted) return;
        Navigator.pop(context);
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

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
    super.dispose();
  }
}
