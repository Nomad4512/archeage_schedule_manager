import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/schedule_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  Timer? timer;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
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
          Expanded(
            flex: 8,
                child: Column(
                  children: [
                    ScheduleCard(height: 200,),
                    const SizedBox(height: 20,),
                    ScheduleCard(height: 300,),
                  ],
                ),
          ),
          const Expanded(
            flex: 1,
            child: NaviBar(),
          ),
        ],
      ),
    );
  }
}



