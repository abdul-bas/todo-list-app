import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/screens/ui/add_task/add_task.dart';
import 'package:to_do_list_app/screens/ui/detail_page/detail_page.dart';
import 'package:to_do_list_app/screens/widgets/home/empty_state.dart';
import 'package:to_do_list_app/screens/widgets/home/search_empty_state.dart';
import 'package:to_do_list_app/screens/widgets/home/task_list_tile.dart';
import 'package:to_do_list_app/screens/widgets/home/task_status_text.dart';
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
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: AppColors.bodySurface,
                        ),
                        child: Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -25),
                              child: SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.1,
                                              ),
                                              blurRadius: 8,
                                              spreadRadius: 1,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          child: TextField(
                                            onChanged: (v) async {
                                              value.filter(v);
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              hintText: '🚀 Search...',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FloatingActionButton(
                                        onPressed: () =>
                                            TaskController.showBottomDialog(
                                              context,
                                              AddTaskScreen(),
                                            ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Add',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(width: 10),
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                'assets/icons/add.png',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TaskStatusText(
                                      count:
                                          '${value.pendingTaskCount} / ${value.tasks.length}',
                                      title: 'Pending',
                                    ),
                                    TaskStatusText(
                                      count:
                                          "${value.completedTaskCount} / ${value.tasks.length}",
                                      title: "Completed",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                value.tasks.isEmpty
                                    ? EmptyTasksState()
                                    : value.filterTask.isEmpty
                                    ? EmptySearchState()
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 10),
                                        shrinkWrap: true,
                                        itemCount: value.filterTask.length,
                                        itemBuilder: (context, index) {
                                          final task = value.filterTask[index];

                                          return InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TaskDetailScreen(
                                                      task: task,
                                                    ),
                                              ),
                                            ),
                                            child: TaskListTile(
                                              taskModel: task,
                                              provider: value,
                                            ),
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (value.isLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.4),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
