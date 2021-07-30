import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Support",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Text(
                  "Online Support",
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
                  "Experts Solutions",
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
                  "FAQs",
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
