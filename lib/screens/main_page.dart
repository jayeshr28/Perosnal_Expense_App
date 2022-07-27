import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_app/screens/home_page.dart';
import 'package:personal_expense_app/screens/profile_screen.dart';
import 'package:personal_expense_app/screens/scheduled_screen.dart';
import 'analytics_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages= [
    HomePage(),
    ScheduledPage(),
    AnalyticsPage(),
    ProfilePage(),
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
      bottomNavigationBar:Container(
        height: MediaQuery.of(context).size.height*0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),

        ),
        child: ClipRRect(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home",),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: "History"),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chart_pie_fill), label: "Analysis"),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_solid), label: "Profile"),

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
      )
    );
  }
}
