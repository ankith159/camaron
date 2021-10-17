import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PondCal extends StatefulWidget {
  const PondCal({Key? key}) : super(key: key);

  @override
  _PondCalState createState() => _PondCalState();
}

class _PondCalState extends State<PondCal> {
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
            DropdownButton(items: [], hint: Text('Shape')),
            DropdownButton(items: [], hint: Text('Sides')),
            Row(
              children: [
                Text('Depth'),
                Expanded(
                  child: ListTile(
                    title: TextField(),
                    trailing: Text('m'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Dimensions (A)'),
                Expanded(
                  child: ListTile(
                    title: TextField(),
                    trailing: Text('m'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Dimensions (B)'),
                Expanded(
                  child: ListTile(
                    title: TextField(),
                    trailing: Text('m'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Save')))
          ],
        ),
      ),
    );
  }
}
