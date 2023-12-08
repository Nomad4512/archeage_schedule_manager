import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class NaviBar extends StatelessWidget {
  const NaviBar({
    super.key,
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
                color: Color(0xFF877DE7),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {},
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
                color: Color(0xFF97A1AB),
                iconSize: MediaQuery.of(context).size.height * 0.04, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}