import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.border),
        const SizedBox(height: 100),
        const Icon(
          Icons.search_off,
          color: AppColors.hint,
          size: 50,
        ),
        const SizedBox(height: 20),
        const Text(
          'No tasks found',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.hint,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Try searching with a different keyword.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.hint,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}