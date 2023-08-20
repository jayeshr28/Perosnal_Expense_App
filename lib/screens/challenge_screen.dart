import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_app/utils/detox_utils.dart';
import 'package:personal_expense_app/utils/journal_utils.dart';
import 'package:personal_expense_app/utils/meditation_utils.dart';
import 'package:personal_expense_app/utils/no_junk_utils.dart';
import 'package:personal_expense_app/utils/reading_utils.dart';
import 'package:personal_expense_app/widgets/calendar_pin.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/workout_utils.dart';

class ChallengePerDay extends StatefulWidget {
  final String image;
  final String habit;
  const ChallengePerDay({Key? key, required this.image, required this.habit})
      : super(key: key);

  @override
  State<ChallengePerDay> createState() => _ChallengePerDayState();
}

class _ChallengePerDayState extends State<ChallengePerDay> {
  int i = 0;

  String getUtils(int i) {
    switch (widget.habit) {
      case "Meditate":
        return MeditationUtils[i];
      case "Workout":
        return WorkoutUtils[i];
      case "Eat Healthy":
        return NoJunkUtils[i];
      case "Reading":
        return ReadingUtils[i];
      case "Daily Journal":
        return JournalUtil[i];
      case "Complete Detox":
        return DetoxUtils[i];
    }
    return "Something went wrong!";
  }

  int lastDay = 0;
  bool _isCompleted(int index) {
    if (lastDay > index) return true;
    return false;
  }

  void incrementDay(int k) {
    setState(() {
      i = k;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          Text(
            "You will face many defeats in life, but never feel defeated !",
            style: TextStyle(fontFamily: "Poppins", fontSize: 20),
          ).p(20),
          Container(
            height: 80,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: CupertinoColors.separator,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Days Completed",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 21,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: _isCompleted(index)
                            ? Icon(
                                Icons.done,
                                color: Colors.blue,
                                size: 15,
                              )
                            : Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                      ).px4();
                    },
                  ),
                ),
              ],
            ),
          ).px8(),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Positioned(
                top: -25,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalendarPin(),
                      Text(
                        "Day " + (i + 1).toString(),
                        style: TextStyle(fontFamily: "Poppins", fontSize: 25),
                      ),
                      CalendarPin()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 300,
            width: double.infinity,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.image), opacity: 0.25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    getUtils(i),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // TextButton(
          //     onPressed: () {
          //       incrementDay(i + 1);
          //     },
          //     child: Text(
          //       "Tap to mark Day " + (i + 1).toString() + " Completed",
          //       style: TextStyle(
          //           color: Colors.green, fontSize: 20, fontFamily: "Poppins"),
          //     )),
        ]),
      ),
    );
  }
}
