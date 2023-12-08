import 'package:flutter/material.dart';

import '../screens/schedules/schedule_screen_main.dart';


class Button extends StatelessWidget {

  final String text;
  final Color bgColor;
  final Color textColor;
  final String whereToGo;

  const Button({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.whereToGo, // 생성자를 통해 whereToGo를 받음
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainSchedule(whereToGo: whereToGo)),
        );
      },
      child:
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
    );
  }
}
