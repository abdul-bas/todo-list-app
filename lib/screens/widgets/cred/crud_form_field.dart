
import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class CRUDFormField extends StatelessWidget {
  const CRUDFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: AppColors.fontColor, fontSize: 14),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.hint, fontSize: 13.5),
        prefixIcon: prefixIcon != null
            ? IconTheme(
                data: const IconThemeData(color: AppColors.hint, size: 20),
                child: prefixIcon!,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconTheme(
                data: const IconThemeData(color: AppColors.hint),
                child: suffixIcon!,
              )
            : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
      ),
    );
  }
}
