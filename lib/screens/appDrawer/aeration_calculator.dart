
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AerationCal extends StatefulWidget {
  const AerationCal({Key? key}) : super(key: key);

  @override
  _AerationCalState createState() => _AerationCalState();
}

class _AerationCalState extends State<AerationCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Feeding Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of stocking(*)'),
            ListTile(
              title: TextField(),
              trailing: Text('pcs'),
            ),
            Text('Avg body weight(*)'),
            ListTile(
              title: TextField(),
              trailing: Text('pcs/KG'),
            ),
            ListTile(
              title: TextField(),
              trailing: Text('g/pc'),
            ),
            Text('Operating hours/day(*)'),
            ListTile(
              title: TextField(),
              trailing: Text('hrs'),
            ),
            Text('Number of Ponds'),
            ListTile(
              title: TextField(),
              trailing: Text('ponds'),
            ),
            Text('Cost'),
            ListTile(
              title: TextField(),
              trailing: Text('\$/kWh'),
            ),
            SizedBox(height: 40),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Save')))
          ],
        ),
      ),
    );
  }
}
