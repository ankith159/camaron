import 'package:app/screens/creaturePage/selece_device.dart';
import 'package:app/screens/devicePage/device_page.dart';
import 'package:app/screens/profilePage/ask_a_demo.dart';
import 'package:app/screens/profilePage/book_a_service.dart';
import 'package:app/screens/profilePage/settings_page.dart';
import 'package:app/screens/profilePage/support_page.dart';
import 'package:app/screens/statisticsPage/selece_device_stat.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feed_calculator_page.dart';

class AppDrawer extends StatelessWidget {
  final _auth = auth.FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                _auth!.displayName ?? '',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                _auth!.email ?? '',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: SvgPicture.asset(
                    'assets/s2.svg',
                    width: 200,
                    height: 200,
                    color: Colors.teal[200],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/device.png',
                width: 28,
                height: 28,
              ),
              title: Text(
                'Devices',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevicesPage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/stats.png',
                width: 28,
                height: 28,
              ),
              title: Text(
                'Statistics',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDeviceStatPage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/fish.png',
                width: 28,
                height: 28,
                color: Colors.black,
              ),
              title: Text(
                'Creatures',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectDevicePage(),
                    ));
              },
            ),
            ListTile(
              // leading: SvgPicture.asset(
              //   'assets/icons/calci.svg',
              //   width: 28,
              //   height: 28,
              // ),
              leading: Icon(Icons.calculate),
              title: Text(
                'Feed Calculator',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedCalculatorPage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/booking.svg',
                width: 28,
                height: 28,
              ),
              title: Text(
                'Book a service',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookAServicePage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/demo.svg',
                width: 28,
                height: 28,
                color: Colors.black,
              ),
              title: Text(
                'Ask for a demo',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AskADemoPage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/support.svg',
                width: 28,
                height: 28,
              ),
              title: Text(
                'Support',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupportPage(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 28,
                height: 28,
              ),
              title: Text(
                'Settings',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
