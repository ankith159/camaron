import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    );
  }
}
