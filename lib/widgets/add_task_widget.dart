import 'package:flutter/material.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/custom_square_button_widget.dart';
import 'package:my_tasks_app/widgets/task_field_widget.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String addYourTask = 'Add your task';
    String taskTitle = 'Title';
    String taskDescription = 'Description';

    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Column(
        children: [
          Text(
            addYourTask,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextFieldWidget(taskTitleOrDescription: taskTitle),
          const SizedBox(height: 20),
          TextFieldWidget(taskTitleOrDescription: taskDescription),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomSquareButtonWidget(
                backgroundColor: TasksColors.vibrantPink,
                icon: Icons.save,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
