import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = true;
  bool _swipeValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Settings",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Alerts",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 228),
                    child: Switch(
                      activeColor: Colors.black12,
                      activeTrackColor: Theme.of(context).primaryColor,
                      value: _switchValue,
                      onChanged: (newValue) {
                        setState(() {
                          _switchValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Notifications",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 178),
                    child: Switch(
                      activeColor: Colors.black12,
                      activeTrackColor: Theme.of(context).primaryColor,
                      value: _swipeValue,
                      onChanged: (newValue) {
                        setState(() {
                          _swipeValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    child: Text(
                      "Background Color",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.only(
                        right: 88, left: 88, top: 18, bottom: 18),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22),
              GestureDetector(
                onTap: () {
                  AuthService().signOut();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    child: Text(
                      "Logout",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.only(
                        right: 131, left: 131, top: 18, bottom: 18),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
