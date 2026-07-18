
import 'package:flutter/material.dart';
import 'package:to_do_list_app/screens/widgets/delete/cancel_button.dart';
import 'package:to_do_list_app/screens/widgets/delete/confirm_button.dart';

class DeleteActions extends StatelessWidget {
  const DeleteActions({super.key, required this.dialogContext, required this.taskId});
  final BuildContext dialogContext;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CancelButton(dialogContext: dialogContext)),
        const SizedBox(width: 12),
        Expanded(
          child: ConfirmDeleteButton(
            dialogContext: dialogContext,
            taskId: taskId,
          ),
        ),
      ],
    );
  }
}
