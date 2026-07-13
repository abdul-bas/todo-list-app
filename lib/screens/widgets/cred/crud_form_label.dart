
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class CRUDFormLabel extends StatelessWidget {
  const CRUDFormLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.hint,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
