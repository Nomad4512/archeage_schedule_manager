import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedules/schedule_screen_daily.dart';

import '../../widgets/check_tab_bar.dart';
import '../../widgets/tab_bar.dart';
import '../schedules/schedule_screen_weekly.dart';
import 'checklist_screen_rifts.dart';


class MainCheck extends StatefulWidget {
  final String whereToGo;
  final int index;

  const MainCheck({Key? key, required this.whereToGo, required this.index}) : super(key: key);

  @override
  _MainCheckState createState() => _MainCheckState();
}

class _MainCheckState extends State<MainCheck> with TickerProviderStateMixin {
  late TabController _tabController;

  int initialIndex = 3;
  late String go;


  @override
  void initState() {
    super.initState();
    initialIndex = widget.whereToGo == 'check' ? 0 : 1;
    go = widget.whereToGo;
    _tabController = TabController(length: 4, vsync: this, initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    print('check - initialIndex : '+'$initialIndex');
    print('check - whereToGo : '+'$go');
    return CheckTabBar(
      screenName: '체크리스트',
      tabController: _tabController,
      whichSchedule: initialIndex,
      children: [
        RiftsCheck(),
        Center(child: Icon(Icons.favorite_outline_rounded)),
      ],
    );
  }
}
