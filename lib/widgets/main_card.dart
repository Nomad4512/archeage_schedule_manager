import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {

  final Color bgColor, txtColor;
  final String shortName, times;
  final double offsetY;
  final IconData icon;

  const MainCard({super.key,
    required this.bgColor,
    required this.txtColor,
    required this.shortName,
    required this.times,
    required this.offsetY,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0,offsetY),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.
          circular(20),
        ),
        child: Padding(
          padding:
          const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shortName,
                    style: TextStyle(
                      color: txtColor,
                      fontSize:32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(times,
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset (-5, 12),
                  child: Icon(
                    icon,
                    color: txtColor,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
