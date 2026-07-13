import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/core/utils/helper/date_picker.dart';
import 'package:to_do_list_app/screens/widgets/cred/crud_form_field.dart';
import 'package:to_do_list_app/screens/widgets/cred/crud_form_label.dart';
import 'package:to_do_list_app/state/create_provider.dart';

class CUFormWidget<T extends CreateProvider> extends StatelessWidget {
  const CUFormWidget({
    super.key,
    required this.formKey,
    required this.onPressed,
    required this.provider,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onPressed;
  final dynamic provider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 20,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Add Task',
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.3,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.bodySurface,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 20,
                                color: AppColors.hint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const CRUDFormLabel(text: 'Task Title'),
                      const SizedBox(height: 6),
                      CRUDFormField(
                        hintText: 'Enter task title',
                        prefixIcon: const Icon(Icons.title_sharp),
                        validator: TaskController.titleValidator,
                        controller: provider.titleController,
                      ),
                      const SizedBox(height: 18),

                      const CRUDFormLabel(text: 'Description'),
                      const SizedBox(height: 6),
                      CRUDFormField(
                        hintText: 'Enter task description',
                        maxLines: 3,
                        prefixIcon: const Icon(Icons.description_outlined),
                        validator: TaskController.descriptionValidator,
                        controller: provider.descriptionController,
                      ),
                      const SizedBox(height: 18),

                      const CRUDFormLabel(text: 'Due Date'),
                      const SizedBox(height: 6),
                      CRUDFormField(
                        hintText: 'Select due date',
                        readOnly: true,
                        onTap: () =>
                            pickDueDate(context, provider.dueDateController),
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                        suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
                        controller: provider.dueDateController,
                        validator: TaskController.dueDateValidator,
                      ),
                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                side: const BorderSide(color: AppColors.border),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: AppColors.hint,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Save Task',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<T>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return Positioned.fill(
                    child: ClipRRect(
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.5),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
