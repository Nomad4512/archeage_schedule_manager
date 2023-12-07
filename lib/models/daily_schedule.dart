class DailySchedule {
  String scheduleName;
  List<DateTime> times;

  DailySchedule(this.scheduleName, this.times);

  // 각 일정에 대한 시간을 초기화하는 팩토리 메서드를 추가
  static List<DailySchedule> initializeSchedules() {
    List<DailySchedule> schedules = [];
    DateTime today = DateTime.now();

    // 현재 시간을 기준으로 일정 시간을 설정합니다.
    List<DateTime> aTimes = [
      DateTime(today.year, today.month, today.day, 0, 20),
      DateTime(today.year, today.month, today.day, 4, 20),
      DateTime(today.year, today.month, today.day, 8, 20),
      DateTime(today.year, today.month, today.day, 12, 20),
      DateTime(today.year, today.month, today.day, 16, 20),
      DateTime(today.year, today.month, today.day, 20, 20),
    ];

    schedules.add(DailySchedule('낮징', aTimes));

    List<DateTime> bTimes = [
      DateTime(today.year, today.month, today.day, 2, 20),
      DateTime(today.year, today.month, today.day, 6, 20),
      DateTime(today.year, today.month, today.day, 10, 20),
      DateTime(today.year, today.month, today.day, 14, 20),
      DateTime(today.year, today.month, today.day, 18, 20),
      DateTime(today.year, today.month, today.day, 22, 20),
    ];

    schedules.add(DailySchedule('밤징', bTimes));

    List<DateTime> cTimes = [
      DateTime(today.year, today.month, today.day, 3, 20),
      DateTime(today.year, today.month, today.day, 7, 20),
      DateTime(today.year, today.month, today.day, 11, 20),
      DateTime(today.year, today.month, today.day, 15, 20),
      DateTime(today.year, today.month, today.day, 19, 20),
      DateTime(today.year, today.month, today.day, 23, 20),
    ];

    schedules.add(DailySchedule('글레샤', cTimes));

    return schedules;
  }
}

