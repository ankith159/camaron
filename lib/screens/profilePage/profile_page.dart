import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ask_a_demo.dart';
import 'book_a_service.dart';
import 'edit_profile.dart';
import 'settings_page.dart';
import 'support_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
          textScaleFactor: 1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          contain(),
        ],
      ),
    );
  }

  Widget contain() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18, top: 50),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 78, top: 70),
                    child: Text(
                      'User Name',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                      textScaleFactor: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'c*********@gmail.com',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookAServicePage(),
                ),
              );
            },
            child: Container(
              child: Text(
                "Book A Service",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AskADemoPage(),
                ),
              );
            },
            child: Container(
              child: Text(
                "Ask A Demo",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SupportPage(),
                ),
              );
            },
            child: Container(
              child: Text(
                "Support",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              );
            },
            child: Container(
              child: Text(
                "Setting",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 18, bottom: 18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  // color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
        ],
      ),
    );
  }
}
