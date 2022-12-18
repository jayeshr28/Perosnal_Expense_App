import 'package:flutter/material.dart';
import 'package:personal_expense_app/utils/meditation_utils.dart';
import 'package:personal_expense_app/widgets/calendar_pin.dart';
import 'package:velocity_x/velocity_x.dart';

class ChallengePerDay extends StatefulWidget {
  final String image;
  const ChallengePerDay({Key? key, required this.image}) : super(key: key);

  @override
  State<ChallengePerDay> createState() => _ChallengePerDayState();
}

class _ChallengePerDayState extends State<ChallengePerDay> {
  int i = 0;

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
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You will face many defeats in life, but never feel defeated !",
            style: TextStyle(fontFamily: "Poppins", fontSize: 20),
          ).p(20),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
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
                    MeditationUtils[i],
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
          TextButton(
              onPressed: () {
                incrementDay(i + 1);
              },
              child: Text(
                "Tap to mark Day " + (i + 1).toString() + " Completed",
                style: TextStyle(
                    color: Colors.green, fontSize: 20, fontFamily: "Poppins"),
              )),
        ]),
      ),
    );
  }
}
