import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/model/task_model.dart';
import 'package:to_do_list_app/screens/widgets/cred/cu_form_widget.dart';
import 'package:to_do_list_app/state/edit_provider.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final formKey = GlobalKey<FormState>();
  late EditProvider editProvider;
  @override
  void initState() {
    super.initState();
    editProvider = context.read<EditProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      editProvider.onInit(widget.taskModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CUFormWidget<EditProvider>(
      formKey: formKey,
      onPressed: () async {
        await editProvider.onEdit(context, formKey);
      },
      provider: editProvider,
    );
  }
}
