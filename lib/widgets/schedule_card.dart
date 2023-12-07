import 'package:flutter/material.dart';
import '../models/daily_schedule.dart';

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
    // 화면 크기를 기준으로 카드의 높이를 계산합니다.
    var screenSize = MediaQuery.of(context).size;
    double cardHeight = screenSize.height * 0.7;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: const Color(0xFF1F2123),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        schedule.scheduleName,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        remainingTime <= Duration.zero ? '일정이 끝났습니다.' : formatDuration(remainingTime),
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
