import 'package:flutter/material.dart';

Future<void> pickDueDate(
  BuildContext context,
  TextEditingController controller,
) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    controller.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
}