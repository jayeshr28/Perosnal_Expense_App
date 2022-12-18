import 'package:flutter/material.dart';

class CalendarPin extends StatelessWidget {
  const CalendarPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 50,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 9.5,
            child: Container(
              height: 60,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 0,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black, width: 1)),
            ),
          )
        ],
      ),
    );
  }
}
