
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class DeleteWarningIcon extends StatelessWidget {
  const DeleteWarningIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.delete_outline_rounded,
        color: AppColors.error,
        size: 28,
      ),
    );
  }
}