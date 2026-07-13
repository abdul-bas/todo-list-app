import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/core/theme/app_theme.dart';
import 'package:to_do_list_app/firebase_options.dart';
import 'package:to_do_list_app/screens/ui/home_sreen/home_screen.dart';
import 'package:to_do_list_app/state/edit_provider.dart';
import 'package:to_do_list_app/state/home_provider.dart';
import 'package:to_do_list_app/state/create_provider.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MultiProvider(
  providers: [ChangeNotifierProvider(create: (context) => CreateProvider(),),
  ChangeNotifierProvider(create: (context) => HomeProvider(),),
  ChangeNotifierProvider(create: (context) => EditProvider(),)],
  child: const ToDoLilstApp()));
}

class ToDoLilstApp extends StatelessWidget {
  const ToDoLilstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
