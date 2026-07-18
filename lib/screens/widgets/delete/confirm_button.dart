

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/state/home_provider.dart';

class ConfirmDeleteButton extends StatelessWidget {
  const ConfirmDeleteButton({super.key, 
    required this.dialogContext,
    required this.taskId,
  });
  final BuildContext dialogContext;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pop(dialogContext);
        await context.read<HomeProvider>().deleteTask(
          context: context,
          id: taskId,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.error,
        padding: const EdgeInsets.symmetric(vertical: 13),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Delete',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}