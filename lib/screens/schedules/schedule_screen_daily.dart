import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/daily_schedule.dart';
import '../../widgets/navigation_bar.dart';
import '../../widgets/navigation_bar_provider.dart';
import '../../widgets/schedule_card.dart';

class DailyScheduleScreen extends StatefulWidget {
  final int index;
  const DailyScheduleScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DailyScheduleScreen> createState() => _DailyScheduleScreenState();
}

class _DailyScheduleScreenState extends State<DailyScheduleScreen> {
  Timer? timer;
  List<DailySchedule> dailySchedules = DailySchedule.initializeSchedules();

  @override
  void initState() {
    super.initState();
    print("initState called - Timer setting up");
    timer?.cancel(); // 기존 타이머가 있다면 취소
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => updateRemainingTime());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigationProvider = Provider.of<NavigationBarProvider>(context, listen: false);
      navigationProvider.selectedIndex = widget.index; // 스크린의 인덱스로 업데이트
    });
  }

  void updateRemainingTime() {
    print("updateRemainingTime called");
    if(mounted){
    setState(() {
      DateTime now = DateTime.now();
      for (var schedule in dailySchedules) { // 현재 시간 이후의 가장 가까운 시간을 찾습니다.
        schedule.times = schedule.times
            .where((time) => time.isAfter(now))
            .toList();
        if (schedule.times.isNotEmpty) { // 리스트가 비어 있지 않다면, 가장 가까운 시간으로 정렬합니다
          schedule.times.sort((a, b) => a.compareTo(b));
        }
      }
    });
  }}

  @override
  void dispose() {
    print("Dispose called-d");
    timer?.cancel();
    print("Is timer active? ${timer?.isActive}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    print('build called - DailyScheduleScreen');
    print('daily index : ${widget.index}');
    print('navigationProvider.selectedIndex : ${navigationProvider.selectedIndex}');
    return Scaffold(
      backgroundColor: Color(0xFF101316),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScheduleCard(schedules: dailySchedules),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: NaviBar(
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

