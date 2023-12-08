import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../buttons/main_button.dart';
import '../widgets/main_card.dart';
import 'schedules/schedule_screen_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String formattedTime = DateFormat('hh:mm:ss a').format(DateTime.now());
  String formattedDate = DateFormat('yy.MM.dd EEE').format(DateTime.now()).toUpperCase();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // 1초마다 현재 시간 업데이트
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        formattedTime = DateFormat('hh:mm:ss a').format(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.
            start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('어서오세요 상속자님!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                '현재 시간',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                formattedTime,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(text: '일정시간', bgColor: Color(0xFFF1B33B), textColor: Colors.black, whereToGo: 'daily',),
                  Button(text: '체크리스트', bgColor: Color(0xFF1F2123), textColor: Colors.white, whereToGo: 'check',),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '즐겨찾기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // 버튼 클릭 시 실행할 로직
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainSchedule(index: 13, whereToGo: 'favorite',),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.8),
                      textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: Text('수정하기'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MainCard(
                offsetY: 0,
                bgColor: Color(0xFF1F2123),
                txtColor: Colors.white,
                shortName: '글레샤',
                times: '00:00:30',
                icon: Icons.wc_rounded,
              ),
              const MainCard(
                offsetY: -20,
                bgColor: Colors.white,
                txtColor: Colors.black,
                shortName: '검은용 크샤나스',
                times: '03:20:23',
                icon: FontAwesomeIcons.dragon,
              ),
              const MainCard(
                offsetY: -40,
                bgColor: Color(0xFF1F2123),
                txtColor: Colors.white,
                shortName: '델피나드 유령선',
                times: '01:03:43',
                icon: FontAwesomeIcons.ghost,
              ),
            ],
          ),
        ),
      ),
    );
  }
}