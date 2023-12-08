import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {

  final String longName;
  final String shortName;
  final String remainingTime;

  const CardBox({
    super.key, required this.longName, required this.shortName, required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 5, 16, 12),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF101315),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x2B000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF1B1F24),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        longName,
                        style: TextStyle(fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              shortName,
                              style: TextStyle(fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                            child: Text(
                              remainingTime,
                              style: TextStyle(fontSize: 20,
                                  color: Theme.of(context).focusColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: Icon(
                  Icons.favorite_outline_rounded,
                  color: Color(0xFF57636C),
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
