import 'package:flutter/foundation.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0; // 초기 선택된 탭 인덱스
  int _currentIndex = 0; // 현재 인덱스를 추적하는 private 변수

  int get selectedIndex => _selectedIndex; // 현재 선택된 인덱스를 가져오는 getter

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // 상태 변경을 리스너들에게 알림
  }
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // 리스너들에게 상태 변경을 알림
  }
}
