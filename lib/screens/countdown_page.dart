import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/timer_pomo.dart';

class CountdownPomoPage extends StatefulWidget {
  final Color color;
  const CountdownPomoPage({Key? key, required this.color}) : super(key: key);

  @override
  State<CountdownPomoPage> createState() => _CountdownPomoPageState();
}

class _CountdownPomoPageState extends State<CountdownPomoPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: 280,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(60)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Task",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Focus on Process!',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Poppins', fontSize: 30),
            ),
            PomodoroTimer(),
            //
            TextButton(
              child: Text(
                "Completed? Let's start a next task",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onPressed: () {},
            )
            // Container(
            //   height: 100,
            //   child: WaveWidget(
            //     config: CustomConfig(
            //       colors: [
            //         Colors.blue,
            //         Colors.lightBlueAccent,
            //         Colors.lightBlue
            //       ],
            //       durations: [5000, 2000, 1000],
            //       heightPercentages: [0.65, 0.67, 0.90],
            //     ),
            //     size: Size(double.infinity, double.infinity),
            //     waveAmplitude: 0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
