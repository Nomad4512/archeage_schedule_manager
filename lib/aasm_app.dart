import 'package:flutter/material.dart';
import 'package:schedule_manager/screens/main_screen.dart';
import 'package:schedule_manager/screens/schedule_screen_daily.dart';

class AasmApp extends StatelessWidget {
  const AasmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(surfaceVariant: Color(0xFF101316),),
        disabledColor: const Color(0xFF87898B), // 선택되지 않은 글, 짙은회색
        unselectedWidgetColor: const Color(0xFF97A1AB), // 선택되지 않은 아이콘, 연한회색
        focusColor: const Color(0xFF877DE7), // 선택된 아이콘, 보라색
      ),
      home: MainScreen(),
    );
  }
}
