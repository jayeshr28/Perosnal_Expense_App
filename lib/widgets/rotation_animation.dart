import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RotateClock extends StatefulWidget {
  const RotateClock({Key? key}) : super(key: key);

  @override
  State<RotateClock> createState() => _RotateClockState();
}

class _RotateClockState extends State<RotateClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: DottedBorder(
                borderType: BorderType.Circle,
                color: Colors.white,
                dashPattern: [3, 45],
                padding: EdgeInsets.all(6),
                strokeWidth: 20,
                child: Container(
                  height: 500,
                  width: 1000,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
