import 'package:flutter/material.dart';

class CustomSquareButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  const CustomSquareButtonWidget({Key? key, required this.backgroundColor, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: Ink(
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
