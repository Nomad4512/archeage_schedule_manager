import 'package:flutter/material.dart';

import '../screens/checklists/checklist_screen_rifts.dart';
import '../screens/main_screen.dart';
import '../screens/schedules/schedule_screen_daily.dart';

class NaviBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NaviBar({
    super.key, required this.currentIndex, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                color: currentIndex == 1 ? Color(0xFF101316) : Color(0xFF877DE7),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  onTap(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DailyScheduleScreen(index: 11,)),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.home_rounded),
                color: Color(0xFF97A1AB),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.event_available_rounded),
                color: currentIndex == 2 ? Color(0xFF101316) : Color(0xFF877DE7),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  onTap(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RiftsCheck()),
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