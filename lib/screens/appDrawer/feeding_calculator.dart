import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedingCal extends StatefulWidget {
  const FeedingCal({Key? key}) : super(key: key);

  @override
  _FeedingCalState createState() => _FeedingCalState();
}

class _FeedingCalState extends State<FeedingCal> {
  TextEditingController stocking = TextEditingController();
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
          DropdownButton(items: [], hint: Text('Species')),
          Text('Number of stocking(*)'),
          ListTile(
            title: TextField(
              controller: stocking,
            ),
            trailing: Text('pcs'),
          ),
          Text('Average body weight of shrimps(*)'),
          ListTile(
            title: TextField(),
            trailing: Text('pcs/KG'),
          ),
          ListTile(
            title: TextField(),
            trailing: Text('g/pc'),
          ),
          Text('Days of culture'),
          ListTile(
            title: TextField(),
            trailing: Text('days'),
          ),
          SizedBox(height: 40),
          Center(child: ElevatedButton(onPressed: () {}, child: Text('Save')))
        ],
      )),
    );
  }
}
