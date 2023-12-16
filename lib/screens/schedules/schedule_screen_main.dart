import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedules/schedule_screen_daily.dart';

import '../../widgets/tab_bar.dart';
import 'schedule_screen_weekly.dart';


class MainSchedule extends StatefulWidget {
  final String whereToGo;
  final int index;

  const MainSchedule({Key? key, required this.whereToGo, required this.index,}) : super(key: key);

  @override
  _MainScheduleState createState() => _MainScheduleState();
}

class _MainScheduleState extends State<MainSchedule> with TickerProviderStateMixin {
  late TabController _tabController;

  int initialIndex = 3;

  @override
  void initState() {
    super.initState();
    switch (widget.whereToGo) {
      case 'daily' :
        initialIndex = 0;
        break;
      case 'weekly' :
        initialIndex = 1;
        break;
      default:
        initialIndex = 2; // 기본값 설정
    }
    _tabController = TabController(length: 3, vsync: this, initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    print('schedule - initialIndex : '+'$initialIndex');
    print('main index : ${widget.index}');
    return TabBarWidget(
      screenName: '일정 타이머',
      tabController: _tabController,
      whichSchedule: initialIndex,
      children: const [
        DailyScheduleScreen(index: 1,),
        WeeklyScheduleScreen(index: 1,),
        Center(child: Icon(Icons.favorite_outline_rounded)), // 즐겨찾기 페이지 만들어질시 index 13
      ],
    );
  }
}
