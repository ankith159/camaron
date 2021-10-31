import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShrimpConverter extends StatefulWidget {
  const ShrimpConverter({Key? key}) : super(key: key);

  @override
  _ShrimpConverterState createState() => _ShrimpConverterState();
}

class _ShrimpConverterState extends State<ShrimpConverter> {
  TextEditingController species = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController segment = TextEditingController();
  TextEditingController avgWeight = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;

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
            // DropdownButton(items: [], hint: Text('Shape')),
            // DropdownButton(items: [], hint: Text('Sides')),
            // DropdownButton(items: [], hint: Text('Shape')),
            // DropdownButton(items: [], hint: Text('Sides')),
            Text('Shrimp Name'),
            ListTile(
              title: TextField(
                controller: species,
              ),
              trailing: Text('days'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Location'),
            ListTile(
              title: TextField(
                controller: location,
              ),
              trailing: Text('days'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Product Segment'),
            ListTile(
              title: TextField(
                controller: segment,
              ),
              trailing: Text('days'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Average weight'),
            ListTile(
              title: TextField(
                controller: avgWeight,
              ),
              trailing: Text('days'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .update({
                    'shripConverter': {
                      'shrimp': species.text,
                      'location': location.text,
                      'segment': segment.text,
                      'avgWeight': avgWeight.text,
                    }
                  }).then((value) {
                    species.clear();
                    location.clear();
                    segment.clear();
                    avgWeight.clear();
                  });
                },
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
