import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../buttons/main_button.dart';
import '../widgets/main_card.dart';

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
    return MaterialApp(
      home: Scaffold(
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
                    Button(text: '일정시간', bgColor: Color(0xFFF1B33B), textColor: Colors.black),
                    Button(text: '체크리스트', bgColor: Color(0xFF1F2123), textColor: Colors.white),
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
                    Text(
                      '수정하기',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  offsetY: 0,
                  bgColor: Color(0xFF1F2123),
                  txtColor: Colors.white,
                  currencyB: '글레샤',
                  balance: '6,428',
                  icon: Icons.euro_rounded,
                ),
                const CurrencyCard(
                  offsetY: -20,
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  currencyB: '검은용 크샤나스',
                  balance: '9,785',
                  icon: Icons.currency_bitcoin,
                ),
                const CurrencyCard(
                  offsetY: -40,
                  bgColor: Color(0xFF1F2123),
                  txtColor: Colors.white,
                  currencyB: '델피나드 유령선',
                  balance: '428',
                  icon: Icons.attach_money_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}