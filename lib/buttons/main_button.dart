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
    final navigationProvider = Provider.of<NavigationBarProvider>(context, listen: false);
    print('button whereToGo : $whereToGo');
    return  GestureDetector(
      onTap: () {
          if(whereToGo == 'daily'){
            navigationProvider.currentIndex = 1;
            Navigator.pushReplacement(
            context,
              MaterialPageRoute(builder: (context) => MainSchedule(whereToGo: whereToGo,index: 1,)),
            );
        } else if (whereToGo == 'rifts'){
            navigationProvider.currentIndex = 2;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainCheck(whereToGo: whereToGo,index: 2,)),
            );
        } else {
        // 안내페이지 예정
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
