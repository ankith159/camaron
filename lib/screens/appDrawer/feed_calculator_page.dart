import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'aeration_calculator.dart';
import 'feeding_calculator.dart';
import 'fish_feed_calculator.dart';
import 'pond_calculator.dart';
import 'shrimp_converter.dart';

class FeedCalculatorPage extends StatefulWidget {
  const FeedCalculatorPage({Key? key}) : super(key: key);

  @override
  _FeedCalculatorPageState createState() => _FeedCalculatorPageState();
}

class _FeedCalculatorPageState extends State<FeedCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Feed Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Fish Feed Calculator'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FishFeedCal()));
            },
          ),
          ListTile(
            title: Text('Feeding Calculator'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedingCal()));
            },
          ),
          ListTile(
            title: Text('Aeration Calculator'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AerationCal()));
            },
          ),
          ListTile(
            title: Text('Pond Calculator'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PondCal()));
            },
          ),
          ListTile(
            title: Text('Shrimp Converter'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShrimpConverter()));
            },
          ),
        ],
      ),
    );
  }
}
