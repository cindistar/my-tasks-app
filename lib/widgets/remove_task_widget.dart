import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks_app/bloc/task_bloc.dart';
import 'package:my_tasks_app/models/task_model.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/custom_square_button_widget.dart';

class RemoveTaskWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  const RemoveTaskWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String removeTask = '';
    String removeTaskText = 'Do you want to remove $removeTask?';
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Column(
        children: [
          Text(
            removeTaskText,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomSquareButtonWidget(
                  backgroundColor: TasksColors.funnyGreen,
                  icon: Icons.check_box_sharp,
                  onTap: () {},
                ),
              ),
              CustomSquareButtonWidget(
                backgroundColor: TasksColors.lucidRed,
                icon: Icons.cancel_presentation,
                onTap: () => BlocProvider.of<TaskBloc>(context).add(TaskRemovedEvent(
                    task: TaskModel(
                  title: title,
                  description: description,
                  date: date,
                ))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
