import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Statistics",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Text(
                  "Device 1",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Text(
                  "Device 2",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Text(
                  "Device 3",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/next.png",
                    ),
                    alignment: Alignment.topRight,
                    fit: BoxFit.contain,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
