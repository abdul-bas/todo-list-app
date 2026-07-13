import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class TaskStatusText extends StatelessWidget {
  const TaskStatusText({super.key, required this.count, required this.title});
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title  ',
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
