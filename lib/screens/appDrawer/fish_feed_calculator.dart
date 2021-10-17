import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FishFeedCal extends StatefulWidget {
  const FishFeedCal({Key? key}) : super(key: key);

  @override
  _FishFeedCalState createState() => _FishFeedCalState();
}

class _FishFeedCalState extends State<FishFeedCal> {
  TextEditingController crudeProtein = TextEditingController();
  TextEditingController feedQuantity = TextEditingController();
  Map ingredients = Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Fish Feed Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              child: Text('%CP'),
            ),
            title: TextField(
              controller: crudeProtein,
            ),
          ),
          ListTile(
            leading: Container(
              child: Text('KG'),
            ),
            title: TextField(
              controller: feedQuantity,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(items: [], hint: Text('Ingredient1')),
              DropdownButton(items: [], hint: Text('Ingredient2')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(items: [], hint: Text('Ingredient3')),
              DropdownButton(items: [], hint: Text('Ingredient4')),
            ],
          ),
          SizedBox(height: 40),
          Center(child: ElevatedButton(onPressed: () {}, child: Text('Save')))
        ],
      ),
    );
  }
}
