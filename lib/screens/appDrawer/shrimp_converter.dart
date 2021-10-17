
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShrimpConverter extends StatefulWidget {
  const ShrimpConverter({Key? key}) : super(key: key);

  @override
  _ShrimpConverterState createState() => _ShrimpConverterState();
}

class _ShrimpConverterState extends State<ShrimpConverter> {
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
            DropdownButton(items: [], hint: Text('Shape')),
            DropdownButton(items: [], hint: Text('Sides')),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
