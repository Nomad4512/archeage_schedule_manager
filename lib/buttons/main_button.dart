import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_manager/screens/checklists/checklist_screen_main.dart';

import '../screens/schedules/schedule_screen_main.dart';
import '../widgets/navigation_bar_provider.dart';


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
          if(whereToGo == 'daily'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainSchedule(whereToGo: whereToGo,index: 10)),
            );
        } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainCheck(whereToGo: whereToGo,index: 20)),
            );
        }

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
