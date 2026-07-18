
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class DeleteTitle extends StatelessWidget {
  const DeleteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Delete Task?',
      style: TextStyle(
        color: AppColors.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

