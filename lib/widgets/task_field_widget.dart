import 'package:flutter/material.dart';
import 'package:my_tasks_app/resources/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.taskTitleOrDescription,
  }) : super(key: key);

  final String taskTitleOrDescription;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        hintText: taskTitleOrDescription,
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
    );
  }
}