import 'package:flutter/material.dart';
import 'package:my_tasks_app/models/task_model.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/add_task_widget.dart';
import 'package:my_tasks_app/widgets/remove_task_widget.dart';
import 'package:my_tasks_app/widgets/task_card_widget.dart';
import 'package:my_tasks_app/utils/task_helper.dart' as task_helper;

class MyTasksScreen extends StatelessWidget {
  MyTasksScreen({Key? key}) : super(key: key);

  final tasksList = List<TaskModel>.from(task_helper.tasks);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TasksColors.secondaryGray,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: TasksColors.primaryGray,
          title: const Padding(
            padding: EdgeInsets.only(left: 10, top: 30),
            child: Text(
              'My Tasks',
              style: TextStyle(
                color: TasksColors.blackNight,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  final task = tasksList[index];
                  return TaskCardWidget(
                    taskName: task.title,
                    taskDescription: task.description,
                    taskDate: task.date,
                    onRemoveTask: () => showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const SizedBox(
                          height: 150,
                          child: RemoveTaskWidget(),
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
