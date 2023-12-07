import 'dart:async';

import 'package:flutter/material.dart';

import '../models/daily_schedule.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/schedule_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  late Timer timer;
  List<DailySchedule> schedules = [];
  List<DailySchedule> dailySchedules = DailySchedule.initializeSchedules();

  @override
  void initState() {
    super.initState();
    schedules = DailySchedule.initializeSchedules();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateRemainingTime());
  }

  void updateRemainingTime() {
    setState(() {
      DateTime now = DateTime.now();
      for (var schedule in schedules) {
        // 현재 시간 이후의 가장 가까운 시간을 찾습니다.
        schedule.times = schedule.times
            .where((time) => time.isAfter(now))
            .toList();

        if (schedule.times.isNotEmpty) {
          // 리스트가 비어 있지 않다면, 가장 가까운 시간으로 정렬합니다.
          schedule.times.sort((a, b) => a.compareTo(b));
        }
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
                    ScheduleCard(multi: 1, schedules: dailySchedules),
                    const SizedBox(height: 20,),
                    ScheduleCard(multi: 2, schedules: dailySchedules),
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



