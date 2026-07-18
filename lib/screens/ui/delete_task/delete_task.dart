import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/screens/widgets/delete/delete_actions.dart';
import 'package:to_do_list_app/screens/widgets/delete/message.dart' show DeleteMessage;
import 'package:to_do_list_app/screens/widgets/delete/title.dart';
import 'package:to_do_list_app/screens/widgets/delete/warning_icon.dart';

class DeleteTask extends StatelessWidget {
  const DeleteTask({
    super.key,
    required this.taskId,
    required this.taskTitle,
    required this.dialogContext,
  });
  final BuildContext dialogContext;
  final String taskId;
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DeleteWarningIcon(),
            const SizedBox(height: 18),
            const DeleteTitle(),
            const SizedBox(height: 8),
            DeleteMessage(taskTitle: taskTitle),
            const SizedBox(height: 24),
            DeleteActions(dialogContext: dialogContext, taskId: taskId),
          ],
        ),
      ),
    );
  }
}

