import 'package:flutter/material.dart';
import 'package:schedule_manager/widgets/checklist_card_box.dart';
import '../models/checklist.dart';
import '../models/daily_schedule.dart';
import 'schedule_card_box.dart';

class CheckCard extends StatelessWidget {
  final List<Checklist> checklists;

  const CheckCard({
    Key? key,
    required this.checklists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: checklists.map((checklist) {

        return CheckCardBox(
          longName: checklist.longName,
          shortName: checklist.shortName,
          category: checklist.category,
          open: checklist.open,
        );
      }).toList(),
    );
  }
}
