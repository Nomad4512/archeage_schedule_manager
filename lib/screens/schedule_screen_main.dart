import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedule_screen_daily.dart';
import 'package:schedule_manager/screens/schedule_screen_weekly.dart';

import '../widgets/tab_bar.dart';


class MainSchedule extends StatefulWidget {
  final String whereToGo;

  const MainSchedule({Key? key, required this.whereToGo}) : super(key: key);

  @override
  _MainScheduleState createState() => _MainScheduleState();
}

class _MainScheduleState extends State<MainSchedule> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    int initialIndex = widget.whereToGo == 'daily' ? 0 : 1;
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      screenName: '메인 스크린',
      tabController: _tabController,
      whichSchedule: 0, // 예시 값
      children: const [
        DailyScheduleScreen(),
        WeeklyScheduleScreen(),
        Center(child: Icon(Icons.favorite_outline_rounded)),
      ],
    );
  }
}
