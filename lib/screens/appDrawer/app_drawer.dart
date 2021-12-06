import 'package:app/screens/creaturePage/selece_device.dart';
import 'package:app/screens/devicePage/device_page.dart';
import 'package:app/screens/profilePage/settings_page.dart';
import 'package:app/screens/profilePage/support_page.dart';
import 'package:app/screens/statisticsPage/selece_device_stat.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
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
                  child: Image.asset(
                    'assets/user.png',
                    width: 200,
                    height: 150,
                    color: Colors.teal[200],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.device_hub,
                size: 28,
                color: Colors.black,
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
              leading: Icon(
                Icons.graphic_eq,
                size: 28,
                color: Colors.black,
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
              leading: Image.asset(
                'assets/fishicon.png',
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
              leading: Icon(
                Icons.calculate,
                size: 28,
                color: Colors.black,
              ),
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
            // ListTile(
            //   leading: Icon(
            //     Icons.book_online,
            //     size: 28,
            //     color: Colors.black,
            //   ),
            //   title: Text(
            //     'Book a service',
            //     style: GoogleFonts.roboto(
            //       fontSize: 18,
            //       color: Colors.black,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => BookAServicePage(),
            //         ));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.help,
            //     size: 28,
            //     color: Colors.black,
            //   ),
            //   title: Text(
            //     'Ask for a demo',
            //     style: GoogleFonts.roboto(
            //       fontSize: 18,
            //       color: Colors.black,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => AskADemoPage(),
            //         ));
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.support,
                size: 28,
                color: Colors.black,
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
              leading: Icon(
                Icons.settings,
                size: 28,
                color: Colors.black,
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
