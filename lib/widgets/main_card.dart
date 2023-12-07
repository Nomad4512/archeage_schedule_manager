import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {

  final Color bgColor, txtColor;
  final String currencyB, balance;
  final double offsetY;
  final IconData icon;

  const CurrencyCard({super.key,
    required this.bgColor,
    required this.txtColor,
    required this.currencyB,
    required this.balance,
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
                  Text(currencyB,
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
                      Text(balance,
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
