import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/screens/widgets/home/body.dart';
import 'package:to_do_list_app/state/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().fetchTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
