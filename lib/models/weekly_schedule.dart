
import 'daily_schedule.dart';

class WeeklySchedule {
  // 요일별 일정 매핑
  static Map<int, List<Map<String, String>>> scheduleByWeekday = {
    1: [ // 월요일
      {'time': '20:30', 'shortName': '황평', 'longName' : '레이드'},
      {'time': '21:00', 'shortName': '침공, 델유', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    2: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    3: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    4: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    5: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    6: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],
    7: [ // 화요일
      {'time': '20:30', 'shortName': '가루다', 'longName' : '레이드'},
      {'time': '21:30', 'shortName': '레이드', 'longName' : '레이드'},
      {'time': '22:00', 'shortName': '아켄', 'longName' : '레이드'},
      // ... 여기에 추가 일정
    ],

    // ... 다른 요일들에 대한 일정
  };

  static List<DailySchedule> getTodaysSchedules() {
    DateTime now = DateTime.now();
    int weekday = now.weekday;
    var todaySchedulesData = scheduleByWeekday[weekday] ?? [];

    List<DailySchedule> todaySchedules = [];
    for (var scheduleData in todaySchedulesData) {
      DateTime time = _parseTime(scheduleData['time']!);
      if (time.isAfter(now)) {
        todaySchedules.add(
            DailySchedule(scheduleData['longName']!,scheduleData['shortName']!, [time])
        );
      }
    }

    // 오늘의 남은 일정 중 가장 가까운 4가지 일정만 선택
    todaySchedules.sort((a, b) => a.times.first.compareTo(b.times.first));
    if (todaySchedules.length > 4) {
      todaySchedules = todaySchedules.sublist(0, 4);
    }

    return todaySchedules;
  }

  static DateTime _parseTime(String timeStr) {
    List<String> parts = timeStr.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }


}
