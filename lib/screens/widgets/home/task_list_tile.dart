import 'package:flutter/material.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/screens/ui/edit_task/edit_task.dart';
import 'package:to_do_list_app/screens/widgets/home/card_icon.dart';
import 'package:to_do_list_app/state/home_provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.taskModel,
    required this.provider,
  });

  final TaskModel taskModel;
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              await provider.updateTaskStatus(
                context: context,
                id: taskModel.id,
                isCompleted: !taskModel.isCompleted,
              );
            },
            icon: taskModel.isCompleted
                ? CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      size: 16,
                      Icons.check,

                      color: AppColors.fontColor,
                    ),
                  )
                : Icon(Icons.radio_button_unchecked, color: AppColors.border),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              taskModel.title,
              style: TextStyle(
                color: taskModel.isCompleted
                    ? AppColors.hint
                    : AppColors.fontColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: taskModel.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: AppColors.hint,
              ),
            ),
          ),
          CardIcon(
            image: 'assets/icons/edit_17763438.png',
            onTap: () {
              TaskController.showBottomDialog(
                context,
                EditTask(taskModel: taskModel),
              );
            },
          ),
          const SizedBox(width: 15),
          CardIcon(
            image: 'assets/icons/delete_3405251.png',
            onTap: () {
              TaskController.showDeleteTaskDialog(
                context,
                taskId: taskModel.id,
                taskTitle: taskModel.title,
              );
            },
          ),
        ],
      ),
    );
  }
}
