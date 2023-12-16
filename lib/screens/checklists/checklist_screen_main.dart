import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedules/schedule_screen_daily.dart';

import '../../widgets/check_tab_bar.dart';
import '../../widgets/tab_bar.dart';
import '../schedules/schedule_screen_weekly.dart';
import 'checklist_screen_rifts.dart';


class MainCheck extends StatefulWidget {
  final String whereToGo;
  final int index;

  const MainCheck({Key? key, required this.whereToGo, required this.index,}) : super(key: key);

  @override
  _MainCheckState createState() => _MainCheckState();
}

class _MainCheckState extends State<MainCheck> with TickerProviderStateMixin {
  late TabController _tabController;

  int initialIndex = 4;

  @override
  void initState() {
    super.initState();
    switch (widget.whereToGo) {
      case 'rifts' :
        initialIndex = 0;
        break;
      case 'instances' :
        initialIndex = 1;
        break;
      case 'dungeon' :
        initialIndex = 2;
        break;
      default:
        initialIndex = 3; // 기본값 설정
    }
    _tabController = TabController(length: 4, vsync: this, initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    print('check - initialIndex : '+'$initialIndex');
    print('check - whereToGo : '+'${widget.whereToGo}');
    print('main index : ${widget.index}');
    return CheckTabBar(
      screenName: '체크리스트',
      tabController: _tabController,
      whichSchedule: initialIndex,
      children: [
        RiftsCheck(index: 2,),
        Center(child: Icon(Icons.star_border_outlined)),
        Center(child: Icon(Icons.rectangle_outlined)),
        Center(child: Icon(Icons.square_outlined)),
      ],
    );
  }
}
