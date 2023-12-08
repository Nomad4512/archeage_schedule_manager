import 'package:flutter/material.dart';

import '../screens/main_screen.dart';


class TabBarWidget extends StatelessWidget {
  final String screenName;
  final TabController tabController;
  final int whichSchedule;
  final List<Widget> children; // TabBarView에 표시할 위젯 리스트

  TabBarWidget({
    required this.screenName,
    required this.tabController,
    required this.whichSchedule,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF101316), // AppBar 배경색을 검은색으로 설정
        title: Text(screenName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,), // 뒤로 가기 버튼 커스터마이즈
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Color(0xFF877DE7), // 선택된 tab 아래 줄 : 보라색
          labelColor: Color(0xFF877DE7), // 선택된 tab : 보라색
          unselectedLabelColor: Color(0xFF97A1AB), // 미선택된 tab : 회색
          tabs: const <Widget>[
            Tab(
              child: Text(
                '일별',
                style: TextStyle(
                  fontSize: 18, // 텍스트 크기 변경
                  fontWeight: FontWeight.w500, // 텍스트 두께 변경
                ),
              ),
            ),
            Tab(
              child: Text(
                '주간',
                style: TextStyle(
                  fontSize: 18, // 텍스트 크기 변경
                  fontWeight: FontWeight.w500, // 텍스트 두께 변경
                ),
              ),
            ),
            Tab(
              child: Text(
                '즐겨찾기',
                style: TextStyle(
                  fontSize: 18, // 텍스트 크기 변경
                  fontWeight: FontWeight.w500, // 텍스트 두께 변경
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: children, // 생성자를 통해 전달받은 children 사용
      ),
    );
  }
}
