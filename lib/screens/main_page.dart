import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_app/screens/home_page.dart';
import 'package:personal_expense_app/screens/pomodoro/widgets/prioritize_task.dart';
import 'package:personal_expense_app/screens/pomodoro/widgets/profile_history.dart';
import 'package:personal_expense_app/screens/scheduled_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    ScheduledPage(),
    PrioritizeWork(),
    ProfileHistory()
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.money_dollar_circle),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        "asset/images/calendar.png",
                      ),
                      color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    ),
                    label: "Make Habit"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chart_pie_fill),
                    label: "Analysis"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: "Profile"),
              ],
              elevation: 5,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex, //New
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}
