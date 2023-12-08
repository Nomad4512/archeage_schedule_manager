import 'package:flutter/material.dart';

class CheckCardBox extends StatelessWidget {

  final String longName, shortName, category;
  final bool open;

  const CheckCardBox({
    super.key, required this.longName, required this.shortName, required this.category, required this.open,
  });

  @override
  Widget build(BuildContext context) {
    if(open && category == '징조'){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 5, 16, 12),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFECE6CC),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: Icon(
                  Icons.check_box_outline_blank,
                  color: Color(0xFF57636C),
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 12, 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        longName,
                        style: TextStyle(fontSize: 25,
                            color: Color(0xFF392f31),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 4, 0, 0),
                            child: Text(
                              shortName,
                              style: TextStyle(fontSize: 20,
                                  color: Color(0xFF392f31)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return Container();
  }}
}
