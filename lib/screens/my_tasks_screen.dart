import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks_app/bloc/task_bloc.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/add_task_widget.dart';
import 'package:my_tasks_app/widgets/remove_task_widget.dart';
import 'package:my_tasks_app/widgets/task_card_widget.dart';
//import 'package:my_tasks_app/utils/task_helper.dart' as task_helper;

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  //final tasksList = List<TaskModel>.from(task_helper.tasks);
  String myTaskAppBarTitle = 'My Tasks';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TasksColors.secondaryGray,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: TasksColors.primaryGray,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Text(
              myTaskAppBarTitle,
              style: const TextStyle(
                color: TasksColors.blackNight,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          ),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            final taskList = state.taskList;
            return Column(
              key: const Key('column-key'),
              children: [
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      final task = taskList[index];
                      return TaskCardWidget(
                        taskName: task.title,
                        taskDescription: task.description,
                        taskDate: task.date,
                        onRemoveTask: () => showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 150,
                              child: RemoveTaskWidget(
                                key: const Key('remove-key'),
                                title: task.title,
                                description: task.description,
                                date: task.date,
                              ),
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 14, bottom: 14),
          child: FloatingActionButton(
            backgroundColor: TasksColors.vibrantPink,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const SizedBox(
                height: 280,
                child: AddTaskWidget(),
              ),
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
