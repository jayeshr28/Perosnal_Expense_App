import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_expense_app/widgets/music.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with SingleTickerProviderStateMixin {
  // Step 2
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 25);
  bool isLive = false;
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => null);
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    setState(() {
      countdownTimer =
          Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
      isLive = true;
    });
  }

  // Step 4
  void stopTimer() {
    setState(() {
      countdownTimer!.cancel();
      isLive = false;
    });
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 25));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Container(
      child: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: 100,
            // ),
            Container(
                width: 200, child: Lottie.asset("asset/lottie/lofi.json")),
            // Step 8
            Text(
              '$minutes : $seconds',
              style: TextStyle(
                  color: Colors.white, fontSize: 70, fontFamily: 'Montserrat'),
            ),
            SizedBox(height: 20),

            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white30),
                    child: IconButton(
                      onPressed: () {
                        if (countdownTimer == null ||
                            countdownTimer!.isActive) {
                          stopTimer();
                          _controller.reset();
                        } else {
                          startTimer();
                          _controller.repeat();
                        }
                      },
                      icon: countdownTimer!.isActive
                          ? FaIcon(
                              FontAwesomeIcons.pause,
                              color: Colors.white,
                            )
                          : FaIcon(FontAwesomeIcons.play, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MusicPlayer()
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Container(
            //   padding: const EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //       color: Colors.white60,
            //       borderRadius: BorderRadius.circular(30)),
            //   child: AnimatedTextKit(
            //     isRepeatingAnimation: true,
            //     repeatForever: true,
            //     animatedTexts: [
            //       FadeAnimatedText('THE HARDER!!',
            //           textStyle:
            //               const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            //           duration: Duration(seconds: 3),
            //           fadeOutBegin: 0.9,
            //           fadeInEnd: 0.7),
            //       FadeAnimatedText('YOU WORK!!',
            //           textStyle: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            //           duration: Duration(seconds: 3),
            //           fadeOutBegin: 0.9,
            //           fadeInEnd: 0.7),
            //       FadeAnimatedText('THE LUCKIER!!!',
            //           textStyle: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            //           duration: Duration(seconds: 3),
            //           fadeOutBegin: 0.9,
            //           fadeInEnd: 0.7),
            //       FadeAnimatedText('YOU GET!!!!',
            //           textStyle: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            //           duration: Duration(seconds: 3),
            //           fadeOutBegin: 0.9,
            //           fadeInEnd: 0.7),
            //     ],
            //   ),
            // ),
            // Step 10
            // IconButton(
            //   onPressed: () {
            //     if (countdownTimer == null || countdownTimer!.isActive) {
            //       stopTimer();
            //     }
            //   },
            //   icon: FaIcon(FontAwesomeIcons.pause),
            // ),
            // // Step 11
            // ElevatedButton(
            //     onPressed: () {
            //       resetTimer();
            //     },
            //     child: Text(
            //       'Reset',
            //       style: TextStyle(
            //         fontSize: 30,
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
