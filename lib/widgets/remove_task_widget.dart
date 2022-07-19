import 'package:flutter/material.dart';
import 'package:my_tasks_app/resources/colors.dart';
import 'package:my_tasks_app/widgets/custom_square_button_widget.dart';

class RemoveTaskWidget extends StatelessWidget {
  const RemoveTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String removeTaskText = 'Do you want to remove Task A ?';
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
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: CustomSquareButtonWidget(
                  backgroundColor: TasksColors.funnyGreen,
                  icon: Icons.check_box_sharp,
                ),
              ),
              CustomSquareButtonWidget(
                backgroundColor: TasksColors.lucidRed,
                icon: Icons.cancel_presentation,
              ),
            ],
          )
        ],
      ),
    );
  }
}
