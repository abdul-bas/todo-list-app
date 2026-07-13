import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class EmptyTasksState extends StatelessWidget {
  const EmptyTasksState({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(color: AppColors.border),
          SizedBox(height: 100),
          const Icon(
            Icons.description_outlined,
            color: AppColors.hint,
            size: 60,
          ),
          const SizedBox(height: 20),
          const Text(
            "You don't have any tasks yet.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.hint,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Start adding tasks and manage your time \neffectively.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.hint, fontSize: 12, ),
          ),
        ],
      ),
    );
  }
}
