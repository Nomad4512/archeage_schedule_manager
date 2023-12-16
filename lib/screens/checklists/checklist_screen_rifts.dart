import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_manager/models/checklist.dart';
import 'package:schedule_manager/widgets/checklist_card.dart';

import '../../widgets/navigation_bar.dart';
import '../../widgets/navigation_bar_provider.dart';

class RiftsCheck extends StatefulWidget {
  final int index;
  const RiftsCheck({super.key, required this.index});

  @override
  State<RiftsCheck> createState() => _RiftsCheckState();
}

class _RiftsCheckState extends State<RiftsCheck> {
  List<Checklist> checklists = Checklist.initializeCheck();


  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    print('rifts index : ${widget.index}');
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
            child: NaviBar(
              currentIndex: navigationProvider.selectedIndex,
              onTap: (index) {
                navigationProvider.selectedIndex = index; // 선택된 인덱스 업데이트
              },
            ),
          ),
        ],
      ),
    );
  }
}