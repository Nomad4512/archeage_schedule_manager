import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              alignment: Alignment.center,
              child: const Text(
                ('일정 남은시간'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              )
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),

            )
          ),
          Flexible(
            flex: 1,
            child: NaviBar(),
          ),
        ],
      ),
    );
  }
}



