import 'package:app/screens/creaturePage/selece_device.dart';
import 'package:flutter/material.dart';
import 'creaturePage/creatures_page.dart';
import 'devicePage/device_page.dart';
import 'home/home_page.dart';
import 'profilePage/profile_page.dart';
import 'statisticsPage/statistics_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 2;

  List<Widget> list = [
    DevicesPage(),
    SelectDevicePage(),
    HomePage(),
    StatisticsPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/device.png',
              height: 24,
            ),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/fish.png',
              height: 24,
            ),
            label: 'Creatures',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/stats.png',
              height: 24,
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Group.png',
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
