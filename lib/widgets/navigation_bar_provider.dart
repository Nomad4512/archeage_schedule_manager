import 'package:flutter/foundation.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0; // 초기 선택된 탭 인덱스

  int get selectedIndex => _selectedIndex; // 현재 선택된 인덱스를 가져오는 getter

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // 상태 변경을 리스너들에게 알림
  }
}
