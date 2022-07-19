import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks_app/bloc/task_bloc.dart';
import 'package:my_tasks_app/models/task_model.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/custom_square_button_widget.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController titleController = TextEditingController(text: '');
  final TextEditingController descriptionController = TextEditingController(text: '');

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String addYourTask = 'Add your task';
  String taskTitle = 'Title';
  String taskDescription = 'Description';

  @override
  Widget build(BuildContext context) {
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
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
              hintText: taskTitle,
              hintStyle: const TextStyle(
                color: TasksColors.shadeGreyThird,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: TasksColors.shadeGreyThird,
                  width: 3,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: TasksColors.shadeGreyThird,
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
              hintText: taskDescription,
              hintStyle: const TextStyle(
                color: TasksColors.shadeGreyThird,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: TasksColors.shadeGreyThird,
                  width: 3,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: TasksColors.shadeGreyThird,
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSquareButtonWidget(
                backgroundColor: TasksColors.vibrantPink,
                icon: Icons.save,
                onTap: () {
                  final date = DateTime.now();
                  final String dateString = DateFormat('dd/MM/yyyy – kk:mm').format(date);
                  BlocProvider.of<TaskBloc>(context).add(TaskAddedEvent(
                      task: TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    date: dateString,
                  )));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
