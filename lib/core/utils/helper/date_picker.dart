import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

Future<void> pickDueDate(
  BuildContext context,
  TextEditingController controller,
) async {
 final DateTime? pickedDate = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime.now(),
  lastDate: DateTime(2100),
  switchToCalendarEntryModeIcon: const Icon(Icons.abc),
  builder: (context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme:  ColorScheme.dark(
          primary: AppColors.fontColor,     
          onPrimary: AppColors.baground,  
         surface: AppColors.bodySurface,
          onSurface: AppColors.fontColor,   
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.baground,
        ),
      ),
      child: child!,
    );
  },
);
  if (pickedDate != null) {
    controller.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
}