import 'package:flutter/material.dart';
import 'package:my_tasks_app/resources/colors.dart';

class TaskCardWidget extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final String taskDate;
  final VoidCallback onRemoveTask;
  const TaskCardWidget({
    Key? key,
    required this.taskName,
    required this.taskDescription,
    required this.taskDate, 
    required this.onRemoveTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.only(left: 14, top: 16),
          color: TasksColors.whiteSnow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onRemoveTask,
                    icon: const Icon(
                      Icons.close,
                      color: TasksColors.strangeGray,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                taskDescription,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 44),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.access_time,
                      color: TasksColors.strangeGray,
                    ),
                  ),
                  Text(
                    taskDate,
                    style: const TextStyle(
                      fontSize: 16,
                      color: TasksColors.strangeGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
