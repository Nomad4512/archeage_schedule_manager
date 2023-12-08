import 'dart:async';
import 'package:flutter/material.dart';

import '../models/daily_schedule.dart';
import '../models/weekly_schedule.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/schedule_card.dart';

class WeeklyScheduleScreen extends StatefulWidget {
  const WeeklyScheduleScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyScheduleScreen> createState() => _WeeklyScheduleScreenState();
}

class _WeeklyScheduleScreenState extends State<WeeklyScheduleScreen> {
  late Timer timer;
  List<DailySchedule> weeklySchedules = WeeklySchedule.getTodaysSchedules();

  @override
  void initState() {
    super.initState();
    // 타이머를 설정하여 일정 업데이트
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => updateRemainingTime());
  }

  void updateRemainingTime() {
    setState(() {
      DateTime now = DateTime.now();
      for (var schedule in weeklySchedules) { // 현재 시간 이후의 가장 가까운 시간을 찾습니다.
        schedule.times = schedule.times
            .where((time) => time.isAfter(now))
            .toList();
        if (schedule.times.isNotEmpty) { // 리스트가 비어 있지 않다면, 가장 가까운 시간으로 정렬합니다
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
    return Scaffold(
      backgroundColor: Color(0xFF101316),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ScheduleCard(schedules: weeklySchedules),
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
