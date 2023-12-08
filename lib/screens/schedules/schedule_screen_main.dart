import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedules/schedule_screen_daily.dart';

import '../../widgets/tab_bar.dart';
import 'schedule_screen_weekly.dart';


class MainSchedule extends StatefulWidget {
  final String whereToGo;

  const MainSchedule({Key? key, required this.whereToGo}) : super(key: key);

  @override
  _MainScheduleState createState() => _MainScheduleState();
}

class _MainScheduleState extends State<MainSchedule> with TickerProviderStateMixin {
  late TabController _tabController;

  int initialIndex = 2;

  @override
  void initState() {
    super.initState();
    switch (widget.whereToGo) {
      case 'daily':
        initialIndex = 0;
        break;
      case 'weekly':
        initialIndex = 1;
        break;
      default:
        initialIndex = 2; // 기본값 설정
    }
    _tabController = TabController(length: 3, vsync: this, initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      screenName: '일정 타이머',
      tabController: _tabController,
      whichSchedule: initialIndex,
      children: const [
        DailyScheduleScreen(),
        WeeklyScheduleScreen(),
        Center(child: Icon(Icons.favorite_outline_rounded)),
      ],
    );
  }
}
