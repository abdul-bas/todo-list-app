
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class DeleteMessage extends StatelessWidget {
  const DeleteMessage({super.key, required this.taskTitle});
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Are you sure you want to delete "$taskTitle"? This action cannot be undone.',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.hint,
        fontSize: 13.5,
        height: 1.4,
      ),
    );
  }
}