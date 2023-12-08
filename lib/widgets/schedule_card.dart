import 'package:flutter/material.dart';
import '../models/daily_schedule.dart';
import 'schedule_card_box.dart';

class ScheduleCard extends StatelessWidget {
  final List<DailySchedule> schedules;

  const ScheduleCard({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  // 'formatDuration'을 클래스의 메서드로 이동합니다.
  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "${twoDigits(d.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: schedules.map((schedule) {
        DateTime? upcomingTime;
        for (var time in schedule.times) {
          if (time.isAfter(DateTime.now())) {
            if (upcomingTime == null || time.isBefore(upcomingTime)) {
              upcomingTime = time;
            }
          }
        }

        var remainingTime = upcomingTime != null
            ? upcomingTime.difference(DateTime.now())
            : Duration.zero;

        return ScheduleCardBox(
          longName: schedule.longName,
          shortName: schedule.shortName,
          remainingTime: formatDuration(remainingTime),
        );
      }).toList(),
    );
  }
}
