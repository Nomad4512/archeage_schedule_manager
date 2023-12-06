import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {

  final double height;

  const ScheduleCard({
    required this.height,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
      Container(
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2123),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              Row(
                children: [
                  Expanded(flex:1, child: Text('1',style: TextStyle(fontSize: 30,color: Colors.white),)),
                  Expanded(flex:2, child: Text('2',style: TextStyle(fontSize: 30,color: Colors.white),)),
                ],
              )
            ],
          )
      ),
    );
  }
}

