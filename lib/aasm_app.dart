import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/schedule_screen.dart';

class AasmApp extends StatelessWidget {
  const AasmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // 앱 전체에서 쓸 테마 넣을 예정
      ),
      home: const ScheduleScreen(),
    );
  }
}
