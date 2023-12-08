import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/daily_schedule.dart';
import '../../widgets/navigation_bar.dart';
import '../../widgets/navigation_bar_provider.dart';
import '../../widgets/schedule_card.dart';

class FavoriteScheduleScreen extends StatefulWidget {
  final int index;
  const FavoriteScheduleScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<FavoriteScheduleScreen> createState() => _FavoriteScheduleScreenState();
}

class _FavoriteScheduleScreenState extends State<FavoriteScheduleScreen> {
  late Timer timer;
  List<DailySchedule> favoriteSchedules = DailySchedule.initializeSchedules();
  // *** 모델 내용 수정하기


  @override
  void initState() {
    super.initState();
    // 타이머를 설정하여 일정 업데이트
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => updateRemainingTime());
  }

  void updateRemainingTime() {
    setState(() {
      DateTime now = DateTime.now();
      for (var schedule in favoriteSchedules) { // 현재 시간 이후의 가장 가까운 시간을 찾습니다.
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
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF101316),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScheduleCard(schedules: favoriteSchedules),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: NaviBar(
              currentIndex: navigationProvider.selectedIndex,
              onTap: (index) {
                navigationProvider.selectedIndex = index; // 선택된 인덱스 업데이트
              },
            ),
          ),
        ],
      ),
    );
  }
}

