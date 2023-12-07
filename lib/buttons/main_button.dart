import 'package:flutter/material.dart';

import '../screens/schedule_screen_daily.dart';

class Button extends StatelessWidget {

  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({super.key,
    required this.text,
    required this.bgColor,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        // 버튼을 눌렀을 때 ScheduleScreen으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScheduleScreen()),
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
