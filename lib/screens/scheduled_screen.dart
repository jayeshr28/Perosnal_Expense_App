import 'package:flutter/material.dart';
import 'package:personal_expense_app/screens/challenge_screen.dart';

class ScheduledPage extends StatelessWidget {
  ScheduledPage({Key? key}) : super(key: key);

  final List<String> avatar = [
    "asset/images/meditate.jpg",
    "asset/images/workout.jpg",
    "asset/images/workout.jpg",
    "asset/images/workout.jpg",
    "asset/images/workout.jpg",
    "asset/images/workout.jpg"
  ];

  final List<String> title = [
    "Meditate",
    "Workout",
    "Productivity",
    "Eat Healthy",
    "Complete Detox",
    "Walk",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: -50,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(500)),
              ),
            ),
            Positioned(
              left: -116,
              top: 250,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(500)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "21 Days Challenge",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Success ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 17,
                            color: Colors.red),
                      ),
                      Text(
                        "will not come ",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 17),
                      ),
                      Text(
                        "Tomorrow ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 17,
                            color: Colors.green),
                      ),
                      Text(
                        "unless you start ",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 17),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 17,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25),
                        padding: const EdgeInsets.all(10),
                        itemCount: 6,
                        itemBuilder: (ctx, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          ChallengePerDay(image: avatar[i])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(avatar[i]),
                                    radius: 35,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    title[i],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
