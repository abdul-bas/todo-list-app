import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/screens/widgets/cred/cu_form_widget.dart';
import 'package:to_do_list_app/state/create_provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final CreateProvider createProvider = context.read<CreateProvider>();

    return CUFormWidget<CreateProvider>(
      formKey: formKey,
      onPressed: () async {
        await createProvider.onSubmit(context, formKey);
      },
     provider: createProvider,
    );
  }
}
