import 'package:flutter/material.dart';
import 'package:schedule_manager/models/checklist.dart';
import 'package:schedule_manager/widgets/checklist_card.dart';

import '../../widgets/navigation_bar.dart';

class RiftsCheck extends StatefulWidget {
  const RiftsCheck({super.key});

  @override
  State<RiftsCheck> createState() => _RiftsCheckState();
}

class _RiftsCheckState extends State<RiftsCheck> {
  List<Checklist> checklists = Checklist.initializeCheck();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101316),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckCard(checklists: checklists),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: NaviBar(),
          ),
        ],
      ),
    );
  }
}