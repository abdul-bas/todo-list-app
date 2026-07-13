
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({super.key, required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(image, color: AppColors.hint, fit: BoxFit.contain),
      ),
    );
  }
}