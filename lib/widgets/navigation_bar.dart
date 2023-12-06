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
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.list_alt_rounded),
                color: Colors.indigo,
                iconSize: MediaQuery.of(context).size.height * 0.07, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.home_rounded),
                iconSize: MediaQuery.of(context).size.height * 0.07, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.event_available_rounded),
                iconSize: MediaQuery.of(context).size.height * 0.07, // 화면 높이에 따라 아이콘 크기 조절
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}