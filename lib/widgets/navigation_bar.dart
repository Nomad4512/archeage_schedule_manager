import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_manager/screens/checklists/checklist_screen_main.dart';
import 'package:schedule_manager/screens/schedules/schedule_screen_main.dart';

import '../screens/checklists/checklist_screen_rifts.dart';
import '../screens/main_screen.dart';
import '../screens/schedules/schedule_screen_daily.dart';
import 'navigation_bar_provider.dart';

class NaviBar extends StatelessWidget {
  final Function(int) onTap;

  NaviBar({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    int currentIndex = navigationProvider.selectedIndex;
    print('currentIndex'+'$currentIndex');
    return Row(
      children: [

        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF101316),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.list_alt_rounded),
                color: currentIndex == 1 ? Color(0xFF877DE7) : Color(0xFF97A1AB),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  onTap(1);
                  navigationProvider.selectedIndex = 1;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainSchedule(index: 1, whereToGo: 'daily',)),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.home_rounded),
                color: Color(0xFF97A1AB),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.event_available_rounded),
                color: currentIndex == 2 ? Color(0xFF877DE7) : Color(0xFF97A1AB),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  onTap(2);
                  navigationProvider.selectedIndex = 2;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainCheck(index: 2, whereToGo: 'rifts',)),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}